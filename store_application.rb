class StoreApplication
  class << self
    def new
      unless @store
        puts "Loading classes"
        require_relative "item.rb"
        require_relative "real_item.rb"
        require_relative "string.rb"
        require_relative "virtual_item.rb"
        require_relative "antique_item.rb"
        require_relative "item_container.rb"
        require_relative "cart.rb"
        require_relative "order.rb"
        #for using second third ...
        require "active_support/all"
      end
      @store ||= self
    end
  end
end
