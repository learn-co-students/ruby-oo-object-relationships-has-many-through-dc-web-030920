require 'pry'

class Customer
  attr_reader :waiter, :customer
  @@all = []

  def initialize(name,age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter,total,tip)
    Meal.new(waiter,self,total,tip)
  end

  def meals
    Meal.all.select do |meal_instance|
      meal_instance.customer == self
    end
  end

  def waiters
    my_meals = self.meals
    my_meals.map do |meal_instance|
      meal_instance.waiter 
    end
    #returns an Array of Waiter instances associated
    #with this customer's meals

  end









end