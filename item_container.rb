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
      if method_name =~ /^all_/
        show_all_item_with_name(
          method_name.to_s
            .sub(/^all_/, "")
            .chomp('s')
        )
      else
        super
      end
    end

    private

    def show_all_item_with_name(name)
      @items.map { |i| i unless i.name.downcase.scan(name).empty? }.compact
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
