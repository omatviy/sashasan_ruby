require_relative "cart.rb"
require_relative "item.rb"

item1 = Item.new({price: 25, weight: 120, name: "Car"})
item2 = Item.new({weight: 120, name: "Car"})

cart = Cart.new
cart.add_item item1
cart.add_item item2

cart.delete_invalid_items

p cart.items