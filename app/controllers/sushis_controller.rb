class SushisController < ApplicationController

  def index
    @sushis = Sushi.all
  end

  def show
    @sushi = Sushi.find(params[:id])
  end
  
end
