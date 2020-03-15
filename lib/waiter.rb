
class Waiter
    attr_reader :customer
    @@all = []

    def initialize(name,years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer,total,tip)
        Meal.new(self,customer,total,tip)
    end
    
    def meals
        Meal.all.select do |meal_instance|
            meal_instance.waiter == self
        end
    end

    def best_tipper
        highest_tip = Meal.all.max_by do |meal_instance|
            meal_instance.tip 
        end
        highest_tip.customer
    end
    #returns the Customer instance associated 
    #with the meal that received the largest tip


end


