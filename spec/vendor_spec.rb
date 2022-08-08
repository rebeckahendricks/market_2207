require './lib/item'
require './lib/vendor'

describe Vendor do
  describe 'initialize' do
    before do
      @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    it 'exists' do
      expect(@vendor).to be_instance_of(Vendor)
    end

    it 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has no inventory by default' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe 'checking stock' do
    before do
      @vendor = Vendor.new("Rocky Mountain Fresh")
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it 'can check the stock of a certain item' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it 'can stock an item and check its inventory' do
      @vendor.stock(@item1, 30)

      expect(@vendor.inventory).to eq({@item1 => 30})

      @vendor.stock(@item1, 25)
      @vendor.stock(@item2, 12)

      expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end

    it 'can check the stock of a certain item' do
      @vendor.stock(@item1, 30)

      expect(@vendor.check_stock(@item1)).to eq(30)

      @vendor.stock(@item1, 25)

      expect(@vendor.check_stock(@item1)).to eq(55)
    end
  end
end
