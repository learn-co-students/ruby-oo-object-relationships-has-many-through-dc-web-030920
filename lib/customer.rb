require 'pry'
class Customer
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age 
        @@all << self
    end 


    def new_meal (waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end 

    def meals
        Meal.all.find_all do |meal|
            meal.customer == self
        end 
    end 

    def waiters 
        self.meals.map do |meal|
            meal.waiter 
        end
    end 

    def self.all 
        @@all
    end
  
end