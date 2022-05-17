require_relative "item.rb"
require_relative "real_item.rb"
require_relative "string.rb"
require_relative "virtual_item.rb"
require_relative "antique_item.rb"
require_relative "item_container.rb"
require_relative "cart.rb"
require_relative "order.rb"
#for using second third ...
require "active_support/all" 


# Dir["*.rb"].each do |lib| 
#     p lib
#     require_relative lib
# end    

@items = []
item1 = VirtualItem.new({ real_price: 125, name: "Car1" })

item2 = RealItem.new({ real_price: 135, weight: 120, name: "Car2" })

item3 = RealItem.new({ real_price: 45, weight: 125, name: "Car3" })

item4 = AntiqueItem.new({ real_price: 140, name: "CarAnt" })

@items << item1 << item2 << item3 << item4
p item1.kind_of? Item
p item1.kind_of? VirtualItem

p @items.second.kind_of? Item
p @items.second.kind_of? VirtualItem
p @items.second.respond_to? :price

p @items.second.send :price
p @items.second.price

# item4 = RealItem.new
# item4.set_value do |i|
#   i.name = "train"
#   i.real_price = 130
#   i.weight = 150
# end

# item3.info {|info, name| puts "#{name} #{info}"}

# cart = Cart.new
# p cart.items

# cart.add_item item1
# cart.add_item item2
# cart.add_item item3
# cart.add_item item4

# p cart.items

# p Cart.min_price
# p Order.min_price
# # puts "="*25
# # p cart.items
# # puts "="*25
# # cart.delete_invalid_items
# # p cart.items
# # puts "="*25


# # p item1.respond_to? :weight

# # p item2.respond_to? :weight
