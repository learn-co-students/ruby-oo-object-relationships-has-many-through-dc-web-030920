require "pry"

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
       
        Meal.all.select {|meals| meals.customer == self}
    end

    def waiters
        meals.map {|x| x.waiter}
        # Meal.all.select {|x| x.customer == self}.map {|x| x.waiter}
        # binding.pry
    end
end