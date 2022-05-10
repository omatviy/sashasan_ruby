require_relative "item_container.rb"

class Order
  attr_reader :items
  # include ItemContainer::Manager
  include ItemContainer

  def initialize
    puts "Cart init"
    @items = []
  end

  def delete_invalid_items
    @items.delete_if { |i| i.price.nil? }
  end
end
