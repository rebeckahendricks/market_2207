require './lib/item'
require './lib/vendor'

describe Vendor do
  describe 'initialize' do
    before do
      # @item1 = Item.new({name: 'Peach', price: "$0.75"})
      # @item2 = Item.new({name: 'Tomato', price: '$0.50'})
      @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    xit 'exists' do
      expect(@vendor).to be_instance_of(Vendor)
    end

    xit 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    xit 'has no inventory by default' do
      expect(@vendor.inventory).to eq({})
    end
  end
end
