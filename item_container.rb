module ItemContainer
  #  module Manager
  module ClassMethods
    MIN_PRICE = 100

    def min_price
      MIN_PRICE
    end
  end

  module InstanceMethods
    def add_item(item)
      puts self.class.name
      @items << item unless item.price < self.class.min_price
    end

    def remove_item
      @items.pop
    end

    def validate
      @items.each do |i|
        puts "item has no price" if i.price.nil?
      end
    end

    def delete_invalid_items
      @items.delete_if { |i| i.price.nil? }
    end

    def delete_items
      @items.clear
    end

    def count_valid_items
      @items.count { |item| item.price }
    end

    def method_missing(method_name)
      puts "method method_missing start: #{method_name} is missed"
      if method_name =~ /^all_/
        puts "starting ...: over #{method_name}"
        name = method_name.to_s
          .sub(/^all_/, "")
          .chomp("s")
        puts "name = #{name}"
        return show_all_item_with_name(name)
      else
        return super
      end
      puts "method method_missing finish: #{method_name} is missed"      
    end

    private

    def show_all_item_with_name(name)
      puts "show_all_item_with_name: start"

      puts @items
      result = @items.map do |i| 
        # p i.name.downcase
        # p i.name.downcase.scan(name).empty?
        i unless i.name.downcase.scan(name).empty? 
      end
      # p result
      puts "show_all_item_with_name: finish"      
      result
    end
  end

  # end

  #  module Info

  #  end

  def self.included(class_instance)
    class_instance.extend(ClassMethods)
    class_instance.class_eval { include InstanceMethods }
  end
end
