class FoodService
  def initialize(food_type)
    @food_type = food_type
  end

  def get_total
    conn = Faraday.new('https://api.nal.usda.gov/ndb/search') do |f|
      f.params['api_key'] = ENV['GOV_API_KEY']
      f.params['q'] = @food_type
      f.adapter Faraday.default_adapter
    end

    response = conn.get
    parsed_response = JSON.parse(response.body)
    return parsed_response["list"]["total"]
  end
end
