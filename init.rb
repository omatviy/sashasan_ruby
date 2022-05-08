#require_relative "cart.rb"
#require_relative "item.rb"
Dir["*.rb"].each do |lib| 
    p lib
    require_relative lib
end    

item1 = VirtualItem.new({ real_price: 25, name: "Car1" })
item2 = RealItem.new({ real_price: 25, weight: 120, name: "Car2" })
item3 = RealItem.new({ weight: 125, name: "Car3" })

item3 = RealItem.new
item3.set_value do |i|
  i.name = "train"
  i.real_price = 30
  i.weight = 150
end

item3.info {|info, name| puts "#{name} #{info}"}

cart = Cart.new
p cart.items

cart.add_item item1
cart.add_item item2
cart.add_item item3

puts "="*25
p cart.items
puts "="*25
cart.delete_invalid_items
p cart.items
puts "="*25


p item1.respond_to? :weight

p item2.respond_to? :weight
