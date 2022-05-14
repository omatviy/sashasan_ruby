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

    begin
      f = File.new(file_path, "r:UTF-8")
      lines = f.readlines
      p lines

      lines.each do |l|
        @items << l.to_real_item
      end
      @items.uniq!
      p @items
    rescue Errno::ENOENT => e
      puts "Exception #{e.message}"
      File.open("#{@owner}_cart.txt", "w") {}
      puts "File #{file_path} was created"
    end
    
    puts "read_from_file finish"
  end
end
