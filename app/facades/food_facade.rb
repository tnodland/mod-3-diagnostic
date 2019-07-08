class FoodFacade
  def initialize(food_type)
    @food_type = food_type
  end

  def total_found
    service = FoodService.new(@food_type)
    service.get_total
  end
end
