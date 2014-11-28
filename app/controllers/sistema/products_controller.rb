class Sistema::ProductsController < Sistema::SistemaController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :is_owner, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end


  def new
    @product = Product.new
    respond_with(@product)
  end

  def edit
  end


  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    flash[:notice] = 'Produto criado com sucesso.'
    respond_with(@product,:location => sistema_products_path)
  end

  def update
    @product.update(product_params)
    flash[:notice] = 'Produto autalizado com sucesso.'
    respond_with(@product,:location => sistema_products_path)
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Produto deletado com sucesso.'
    respond_with(@product,:location =>  sistema_products_path)
  end

  private

    def is_owner
      unless current_user && @product.user_id == current_user.id
        redirect_to root_path, notice: 'Você não está logado ou não é dono do produto para realizar esta ação.'
      end
    end

    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description,:price,:user_id, :market_id,:image )
    end
end
