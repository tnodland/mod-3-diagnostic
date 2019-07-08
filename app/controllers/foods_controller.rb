class FoodsController < ApplicationController
  def index
    render locals: {
      foods: FoodFacade.new(params["q"])
    }
  end
end
