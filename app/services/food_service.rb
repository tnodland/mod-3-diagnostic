class FoodService
  def initialize(food_type)
    @food_type = food_type
  end

  def get_total
    response = JSON.parse(conn.get.body)
    return response["list"]["total"]
  end

  def get_ten
    response = JSON.parse(conn.get.body)
    return response["list"]["item"][0..9]
  end

  private

    def conn
      @_conn ||= Faraday.new('https://api.nal.usda.gov/ndb/search') do |f|
                  f.params['api_key'] = ENV['GOV_API_KEY']
                  f.params['q'] = @food_type
                  f.adapter Faraday.default_adapter
                end
    end
end
