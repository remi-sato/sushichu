class SushisController < ApplicationController

  def index
    @sushis = Sushi.all
  end
  
end
