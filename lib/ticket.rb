class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :movie

    def num_of_seats_available
        #binding.pry
        self.movie.capacity > 0 ? (self.movie.capacity -= 1) : false
        self.movie.save
    end

    def num_of_seats_sold
        self.all.count
    end
end