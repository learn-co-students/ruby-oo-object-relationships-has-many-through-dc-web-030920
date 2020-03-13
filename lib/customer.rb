class Customer

    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end
  

    def new_meal(waiter, total, tip)
        Meal.new(self, waiter, total, tip)

    end

    def meals
        Meal.all.select{|meal| meal.customer == self}
    end

    def waiters
        Meal.all.select{|meal| meal.customer == self}.map{|customer_meal| customer_meal.waiter}
    end


    def self.all
        @@all
    end
end