class User < ActiveRecord::Base
    has_many :tickets
    has_many :movies, through: :tickets
    
    #address returning a user or creating a new user
    def self.activating_user(u_name)
       User.find_or_create_by(name: u_name)
    end  

    def browse_movies
        movies = Movie.all.map{|movie|movie.title}
        prompt = TTY::Prompt.new
        movie_choice = prompt.select("Choose a Movie", movies, filter: true)
    end

    def purchase_movie(selected_movie)
        selection = selected_movie
        prompt = TTY::Prompt.new
        buy = prompt.yes?("Would you like to purchase #{selection}?")
        #nested logic to create a ticket only when there is capacity
        if (Movie.find_by(title: selection).seats_sold) < (Movie.find_by(title: selection).capacity)
            #this bit of logic was fun, it's an instantiation of ticket with nested find functions
            if buy
                new_ticket = Ticket.create(user_id: User.find_by(name: self.name).id, movie_id: Movie.find_by(title: selection).id)
                puts "Enjoy your purchase of #{selection}!"
                new_ticket.num_of_seats_available
                false
            else
                false
            end
        else
            puts "Movie is sold out!"
        end
    end

    def view_ticket
        tickets = self.tickets.all
        my_tickets = tickets.map{|ticket| "#{Movie.find_by(id: ticket.movie_id).title}: $#{Movie.find_by(id: ticket.movie_id).price}"}
        puts my_tickets
        my_tickets
    end

    def cancel_ticket_display
        prompt = TTY::Prompt.new
        ticket_list = self.view_ticket
        ticket_list.length > 0 ? (selected_movie = prompt.select("Choose a Movie", ticket_list, filter: true)) : (puts "You don't have any tickets.")
    end

    def cancel_ticket(selected_movie)
        if selected_movie
            selection = selected_movie
            # this was challenging code was working until we had a title phrase
            # the split method with choosing the colon as the seperator allowed for use of the
            # movie in the find function
            selection = selection.split(":")[0]
            prompt = TTY::Prompt.new
            cancel = prompt.yes?("Would you like to cancel #{selection}?")
            # order of logic really matters to display the cancel to the user
            if cancel
                ticket_to_cancel = Ticket.find_by(user_id: self.id, movie_id: Movie.find_by(title: selection).id)
                ticket_to_cancel.add_back_seat
                puts "You have cancelled the purchase of #{selection}."
                ticket_to_cancel.destroy
                false
            else
                false
            end
        end
    end
end # End of Class