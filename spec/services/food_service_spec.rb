require 'rails_helper'

RSpec.describe FoodService do
  it "can get total foods" do
    service = FoodService.new("sweet potatoes")
    expect(service.get_total).to eq(531)
  end
end
