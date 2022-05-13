class String
  def to_real_item
    puts "String: to_real_item start"
    l = self.chomp.split(":")
    p l
    item = RealItem.new
    item.set_value do |i|
      i.name = l[0]
      i.real_price = l[1].to_f
      i.weight = l[2].to_f
    end
    p item
    puts "String: to_real_item finish"
    return item
  end
end
