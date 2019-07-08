require 'rails_helper'

RSpec.describe FoodService do
  it "can get total foods" do
    service = FoodService.new("sweet potatoes")
    expect(service.get_total).to eq(531)
  end

  it "can get ten foods" do
    service = FoodService.new("sweet potatoes")

    ten_foods  = service.get_ten

    expect(ten_foods.count).to eq(10)
    expect(ten_foods[0]).to have_key("offset")
    expect(ten_foods[0]).to have_key("group")
    expect(ten_foods[0]).to have_key("name")
    expect(ten_foods[0]).to have_key("ndbno")
    expect(ten_foods[0]).to have_key("ds")
    expect(ten_foods[0]).to have_key("manu")
  end
end
