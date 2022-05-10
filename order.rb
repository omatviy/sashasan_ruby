require_relative "item_container.rb"

class Order
  attr_reader :items
  # include ItemContainer::Manager
  include ItemContainer

  def initialize
    puts "Cart init"
    @items = []
  end

  def self.price
    100
  end

  def notification
  end
end
