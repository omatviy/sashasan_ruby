require_relative "item_container.rb"

class Order
  attr_reader :items
  # include ItemContainer::Manager
  include ItemContainer

  def initialize
    puts "Cart init"
    @items = []
  end

  def self.price
    100
  end

  def place
    Pony.mail({
      to: StoreApplication::Admin.email,
      from: "My store <mail@gmail.com>", 
      via: :smtp,
      via_options: {
        address: "smtp.gmail.com",
        port: "587",
        enable_starttls_auto: true,
        user_name: "omatviy@gmail.com",
        password: StoreApplication::Admin.pass,
        authentication: :plain, 
        domain: "gmail.com", 
      },
      subject: "New order",
      body: "Check your admin page"
    })
  end
end
