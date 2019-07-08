class Food
  attr_reader :ndb_num, :type, :group, :source, :manufacturer

  def initialize(food_data)
    @ndb_num = food_data["ndbno"]
    @type = food_data["name"]
    @group = food_data["group"]
    @source = food_data["ds"]
    @manufacturer = food_data["manu"]
  end
end
