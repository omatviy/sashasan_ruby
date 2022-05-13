require_relative "item_container.rb"

class Cart
  attr_reader :items
  # include ItemContainer::Manager
  include ItemContainer

  def initialize(owner)
    puts "Cart init"
    @items = []
    @owner = owner
  end

  def self.min_price
    20
  end

  def save_to_file
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each { |i| f.puts "#{i.name}:#{i.price}:#{i.weight}" }
    end
  end

  def read_from_file
    return unless File.exist?("#{@owner}_cart.txt")

    lines = File.readlines("#{@owner}_cart.txt", "r")
    puts "\nlines=#{lines.size}"
    
    lines.delete_if { |l| !l.include?(":") }
    puts "\nlines=#{lines.size}"

    lines.map! { |l| l.chomp.split(":") }
    
    lines.each do |l|
      item = RealItem.new
      item.set_value do |i|
        i.name = l[0]
        i.real_price = l[1].to_i
        i.weight = l[2].to_i
      end
      @items << item
    end

    @items.uniq!
  end
end
