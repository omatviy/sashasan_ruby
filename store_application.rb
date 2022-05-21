class StoreApplication
  class << self
    attr_accessor :name, :environment
    # def new
    #   unless @store
    #     puts "Loading classes"
    #     require_relative "item.rb"
    #     require_relative "real_item.rb"
    #     require_relative "string.rb"
    #     require_relative "virtual_item.rb"
    #     require_relative "antique_item.rb"
    #     require_relative "item_container.rb"
    #     require_relative "cart.rb"
    #     require_relative "order.rb"
    #     #for using second third ...
    #     require "active_support/all"
    #   end
    #   @store ||= self
    # end

    def set
      unless @store
        yield self

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
      else
        puts "StoreApplication: Can't twice"
      end
      @store ||= self
    end

    def admin(&block)
      @admin ||= Admin.new(&block)
    end

    def inspect
      puts "name = #{@name}" if @name
      puts "environment = #{@environment}" if @environment
      p Admin
    end

    class Admin
      class << self
        attr_accessor :email, :login

        def new(&block)
          unless @store
            yield self
          else
            puts "Admin: Can't twice"
          end
          @store ||= self
        end

        def inspect
          puts "email = #{@email}" if @email
          puts "login = #{@login}" if @login
        end
      end
    end
  end
end
