class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]
  
  respond_to :html

  def index
    @markets = Market.all
    respond_with(@markets)
  end

  def show
    respond_with(@market)
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
    respond_with(@market,:location => markets_system_index_path, notice: 'Mercado criado com sucesso.')
  end

  def update
    @market.update(market_params)
    respond_with(@market,:location => markets_system_index_path, notice: 'Mercado atualizado com sucesso.')
  end

  def destroy
    @market.destroy
    redirect_to markets_system_index_path, notice: 'Mercado apagado com sucesso.'
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
