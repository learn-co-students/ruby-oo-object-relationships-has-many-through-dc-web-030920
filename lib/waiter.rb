class Waiter
@@all  = []
    attr_reader :name, :years_e

    def initialize(name, years_e)
        @name = name 
        @years_e = years_e 
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals 
        Meal.all.find_all do |meal|
            meal.waiter == self
        end
    end 

    def best_tipper
        largest_tip = 0
        best_tipper = nil 
        self.meals.each do |meal|
            if meal.tip > largest_tip
                largest_tip = meal.tip
                best_tipper = meal.customer
            end
        end
        best_tipper
    end
end