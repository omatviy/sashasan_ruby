# run with ruby add_to_cart.rb sasha Car2 Car3
require_relative "init.rb"

owner = ARGV.delete_at(0)
cart = Cart.new(owner)

p @items

@items.each do |item|
  cart.add_item item if ARGV.include?(item.name)
end

p cart.items

cart.save_to_file

cart.delete_items
p cart.items

cart.read_from_file
cart.items.each do |i|
  puts "=" * 25
  i.info { |info, name| puts "#{name} #{info}" }
end
p cart.items

owner2 = "#{owner}1"
cart2 = Cart.new(owner2)
cart2.read_from_file