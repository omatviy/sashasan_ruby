module ItemContainer
  #  module Manager
  def add_item(item)
    @items << item
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

  # end

  #  module Info
  def count_valid_items
    @items.count { |item| item.price }
  end

  #  end
end
