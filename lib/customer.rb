require 'pry'

class Customer
  
    attr_reader :name, :age, :waiter

    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select { |meal_instance| meal_instance.customer == self }
    end

    def waiters
        meals.map do |meal_instance|
            meal_instance.waiter
        end
    end


end