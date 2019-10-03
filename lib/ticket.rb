class Ticket < ActiveRecord::Base
    belongs_to :user
    belongs_to :movie

    def num_of_seats_available
        self.movie.capacity > self.movie.seats_sold ? (self.movie.seats_sold += 1) : false
        self.movie.save
    end
    
    def add_back_seat
        self.movie.capacity >= self.movie.seats_sold ? (self.movie.seats_sold -= 1) : false
        self.movie.save
    end
end