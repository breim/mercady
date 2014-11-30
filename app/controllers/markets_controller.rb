class MarketsController < ApplicationController
  before_action :set_market, only: [:show]
  impressionist actions: [:show], :unique => [:impressionable_type, :impressionable_id, :session_hash]
  
  respond_to :html

  def index
    if params[:busca]
      @markets = Market.near(params[:busca],6,:units => :km).order('distance').take(10)
      respond_with(@markets)
    else
      @markets = Market.all
      respond_with(@markets)
    end

  end

  def show
    impressionist(@market)
    @products = @market.products
    @nearby_markets = Market.near(@market.address,5,:units => :km).order('distance').take(10)
  end


  private
  def set_market
    @market = Market.friendly.find(params[:id])
  end


  def market_params
    params.require(:market).permit(:name, :cnpj, :address, :latitude, :longitude, :city, :state, :phone, :image,:email)
  end
end
