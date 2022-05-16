class Item
  attr_accessor :name, :real_price

  def initialize(options = {})
    @name = options[:name] if options[:name]
    @real_price = options[:real_price] if options[:real_price]
  end

  def info
    if block_given?
      puts "Item info start:"
      yield @name, "item name:"
      yield @real_price, "item price:"
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

  def self.discount
    Time.now.month == 6 ? 0.4 : 0.1
  end

  def price
    @real_price - @real_price * self.class.discount if @real_price
  end

  def to_s 
    "#{self.name}:#{self.price}"
  end
end
