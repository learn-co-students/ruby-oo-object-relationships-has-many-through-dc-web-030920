require 'pry'
class Waiter

    attr_reader :name, :years, :meal

    @@all = []
    def initialize(name, years)
        @name = name
        @meal = meal
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal_instance| meal_instance.waiter == self }
    end

    def best_tipper
        meals.max do |meal_instance, meal_instance2|
            meal_instance.tip <=> meal_instance2.tip
        end.customer
    end
end