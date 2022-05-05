class Item
  attr_accessor :name, :weight, :price

  def initialize(options = {})
    @name = options[:name] if options[:name]
    @weight = options[:weight] if options[:weight]
    @price = options[:price] if options[:price]
  end

  def info
    if block_given?
      puts "Item info start:"
      yield @name, "item name:"
      yield @weight, "item weight:"
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
