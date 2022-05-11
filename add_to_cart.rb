require_relative "init.rb"

cart = Cart.new

p @items 

@items.each do |item|
    cart.add_item item if ARGV.include?(item.name)
end

p cart.items