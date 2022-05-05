class RealItem < Item
    attr_accessor :eight
  
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
  
  end
  