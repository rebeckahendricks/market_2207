class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def total_inventory
    items_hash = {}
    @vendors.each do |vendor|
      vendor.inventory.map do |item, quantity|
        if !items_hash[item]
          items_hash[item] = {quantity: 0, vendors: []}
          items_hash[item][:quantity] += quantity
          items_hash[item][:vendors] << vendor
        else
          items_hash[item][:quantity] += quantity
          items_hash[item][:vendors] << vendor
        end
      end
    end
    items_hash
  end

  def overstocked_items
    overstocked = []
    total_inventory.each do |item, info|
      overstocked << item if info[:quantity] > 50 && info[:vendors].count > 1
    end
    overstocked
  end
end
