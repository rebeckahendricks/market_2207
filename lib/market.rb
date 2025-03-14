class Market
  attr_reader :name, :vendors, :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime("%d/%m/%Y")
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
      vendor.inventory.each do |item, quantity|
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

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end

  def sell(item, quantity)
    if total_inventory[item] && total_inventory[item][:quantity] > quantity
      @vendors.each do |vendor|
        quantity_1 = quantity
        if vendor.inventory.include?(item) && vendor.inventory[item] >= quantity_1
          vendor.inventory[item] -= quantity_1
        elsif vendor.inventory.include?(item) && vendor.inventory[item] < quantity_1
          vendor.inventory[item] -= vendor.inventory[item]
          quantity_1 -= vendor.inventory[item]
        end
      end
      true
    else
      false
    end
  end
end
