require './lib/item'
require './lib/vendor'

describe Item do
  describe 'initialize' do
    before do
      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    xit 'exists' do
      expect(@item1).to be_instance_of(Item)
      expect(@item2).to be_instance_of(Item)
    end

    xit 'has a name' do
      expect(@item2.name).to eq("Tomato")
    end

    xit 'has a price' do
      expect(@item2.price).to eq(0.5)
    end
  end
end
