require_relative "store_application.rb"

# Dir["*.rb"].each do |lib|
#     p lib
#     require_relative lib
# end
# StoreApplication.new
# StoreApplication.new

StoreApplication.set do |app|
  app.name = "Ruby app"
  app.environment = :development

  app.admin do |admin|
    #p admin.name
    admin.login = "admin"
    admin.email = "omatviy@gmail.com"
    admin.pass = "dlde jqwd mchn xfwp"
  end
end

p StoreApplication
unless StoreApplication.frozen?
  StoreApplication.name = "Ruby app new"
  StoreApplication.admin.email = "new@gmail.com"
  puts "Some changes:"
  p StoreApplication
end

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

order = Order.new
@items.each {|i| order.add_item i}
order.place

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
