class Waiter

    attr_reader :name, :num
    @@all = []
    def initialize(name, num)
        @name = name
        @experience = num
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|x| x.waiter == self}
    end

    def best_tipper
        # binding.pry
        
        
        meals.max do |x, y| 
        #    binding.pry
          x.tip <=> y.tip
        end.customer
      
        #    puts instance.customer.tip
        # end
        # # binding.pry
    end
end