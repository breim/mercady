class MarketsController < ApplicationController
  before_action :set_market, only: [:show, :edit, :update, :destroy]

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
    @market.save
    respond_with(@market)
  end

  def update
    @market.update(market_params)
    respond_with(@market)
  end

  def destroy
    @market.destroy
    respond_with(@market)
  end

  private
    def set_market
      @market = Market.find(params[:id])
    end

    def market_params
      params.require(:market).permit(:name, :cnpj, :address, :latitude, :longitude)
    end
end
