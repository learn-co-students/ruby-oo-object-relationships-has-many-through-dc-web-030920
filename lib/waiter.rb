class Waiter
  attr_accessor :name, :years_experience
  @@all = []

    def initialize(name, years_experience)
      @name = name
      @years_experience = years_experience
      @@all << self
    end

    def self.all
      @@all
    end

    def new_meal(customer,total,tip)
      Meal.new(self,customer,total,tip)
    end

    def meals
      Meal.all.select{|m| m.waiter == self}
    end

    def best_tipper
      best_tip = 0
      best_tip_name = ""
      Meal.all.each do|meal| 
        if meal.tip > best_tip
           best_tip = meal.tip
           best_tip_name = meal.customer 
        end
      end
      best_tip_name
    end


end