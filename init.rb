#require_relative "cart.rb"
#require_relative "item.rb"
Dir["*.rb"].each do |lib| 
    p lib
    require_relative lib
end    

item1 = Item.new({ price: 25, weight: 120, name: "Car" })
item2 = Item.new({ weight: 120, name: "Car" })

item3 = Item.new
item3.set_value do |i|
  i.name = "train"
  i.price = 30
  i.weight = 150
end

item3.info {|info, name| puts "#{name} #{info}"}

cart = Cart.new
cart.add_item item1
cart.add_item item2

cart.delete_invalid_items

p cart.items
