class Item
  attr_accessor :name, :price

  def initialize(options = {})
    @name = options[:name] if options[:name]
    @price = options[:price] if options[:price]
  end

  def info
    if block_given?
      puts "Item info start:"
      yield @name, "item name:"
      yield @price, "item price:"
      puts "Item info finish"
    else
      puts "Nothing to show"
    end
  end

  def set_value
    if block_given?
      yield self
    else
      puts "Block is not given"
    end
  end
end
