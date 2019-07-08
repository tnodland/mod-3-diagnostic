class FoodFacade
  def initialize(food_type)
    @food_type = food_type
  end

  def total_found
    service.get_total
  end

  def relevant_ten
    foods = service.get_ten
    foods.map do |food_data|
      Food.new(food_data)
    end
  end

  private

    def service
      @_service ||= FoodService.new(@food_type)
    end
end
