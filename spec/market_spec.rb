require './lib/item'
require './lib/vendor'
require './lib/market'

describe Market do
  describe 'initialize' do
    before do
      @market = Market.new("South Pearl Street Farmers Market")
    end

    it 'exists' do
      expect(@market).to be_instance_of(Market)
    end

    it 'has a name' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it 'has no vendors by default' do
      expect(@market.vendors).to eq([])
    end
  end
end
