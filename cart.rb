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
    puts "save_to_file start"
    File.open("#{@owner}_cart.txt", "w") do |f|
      @items.each do |item|
        p item
        puts item
        f.puts item
      end
    end
    puts "save_to_file finish"
  end

  def read_from_file
    puts "read_from_file start"

    file_path = "#{@owner}_cart.txt"

    return unless File.exist?("#{@owner}_cart.txt")

    f = File.new(file_path, "r:UTF-8")
    lines = f.readlines
    p lines
    # lines = File.readlines("#{@owner}_cart.txt", "r")
    # p lines
    # puts "\nlines=#{lines.size}"
    # puts lines

    # lines.delete_if { |l| !l.include?(":") }
    # puts "\nlines=#{lines.size}"
    # p lines
    # lines.map! { |l| l.chomp.split(":") }

    # lines.each do |l|
    #   item = RealItem.new
    #   item.set_value do |i|
    #     i.name = l[0]
    #     i.real_price = l[1].to_i
    #     i.weight = l[2].to_i
    #   end
    #   @items << item
    # end
    lines.each do |l|
      p l
      @items << l.to_real_item
    end
    @items.uniq!
    p @items
    puts "read_from_file finish"
  end
end
