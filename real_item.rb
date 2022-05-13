class RealItem < Item
  attr_accessor :weight

  def initialize(options = {})
    @weight = options[:weight] if options[:weight]
    super
  end

  def info
    if block_given?
      puts "RealItem info start:"
      yield @weight, "item weight:"
      super
      puts "RealItemItem info finish"
    else
      puts "Nothing to show"
    end
  end

  def set_value
    if block_given?
      yield self
      #super
    else
      puts "Block is not given"
    end
  end

  #def self.discount
    #Time.now.month == 6 ? 0.4 : 0.1
  #  super
  #end

  def to_s 
    "#{self.name}:#{self.price}:#{self.weight}"
  end

end
