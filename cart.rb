require_relative "item_container.rb"

class Cart
  attr_reader :items
  # include ItemContainer::Manager
  include ItemContainer

  def initialize
    puts "Cart init"
    @items = []
  end

end
