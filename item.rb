class Item
  attr_accessor :name, :weight, :price

  def initialize(options = [])
    @name = options[:name]
    @weight = options[:weight]
    @price = options[:price]
  end

  def info
    if block_given?
        yield @name 
        yield @weight 
        yield @price
    else
        puts "Nothing to show"
    end
  end
end
