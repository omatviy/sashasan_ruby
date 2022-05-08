module ItemContainer
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
end
