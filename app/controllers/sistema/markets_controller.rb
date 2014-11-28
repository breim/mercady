class Sistema::MarketsController < Sistema::SistemaController
  before_action :set_market, only: [:edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]
  
  respond_to :html

  def index
    @markets = Market.where(user_id: current_user)
    respond_with(@markets)
  end


  def new
    @market = Market.new
    respond_with(@market)
  end

  def edit
  end

  def create
    @market = Market.new(market_params)
    @market.user_id = current_user.id
    @market.save
    flash[:notice] = 'Mercado criado com sucesso.'
    respond_with(@market,:location =>  sistema_markets_path)
  end

  def update
    @market.update(market_params)
    flash[:notice] = 'Mercado atualizado com sucesso.'
    respond_with(@market,:location =>  sistema_markets_path)
  end

  def destroy
    @market.destroy
    flash[:notice] = 'Mercado apagado com sucesso.'
    respond_with(@market,:location =>  sistema_markets_path)
  end

  private
  def set_market
    @market = Market.friendly.find(params[:id])
  end

  def is_owner
    if current_user && @market.user_id == current_user.id
    else
      redirect_to root_path, notice: 'Você não está logado ou não é dono do supermercado para realizar esta ação.'
    end
  end

  def market_params
    params.require(:market).permit(:name, :cnpj, :address, :latitude, :longitude, :city, :state, :phone, :image,:email)
  end
end
