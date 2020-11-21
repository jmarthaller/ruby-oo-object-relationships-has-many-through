require 'pry'

class Waiter
    attr_accessor :name, :experience

    @@all = []
    
    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        #binding.pry
        sorted = meals.sort_by { |meal| meal.tip }
        last = sorted.pop
        last.customer
       # binding.pry
    end
end