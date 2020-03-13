class Waiter

    attr_reader :name, :experience

    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(customer, self, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        tip_amount = 0;
        tipper = ""
        Meal.all.each do |meal|
            if meal.tip > tip_amount
                tip_amount = meal.tip
                tipper = meal.customer
            end
        end
        tipper
    end

    def self.all
        @@all
    end


end