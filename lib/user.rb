class User < ActiveRecord::Base
    has_many :tickets
    has_many :movies, through: :tickets
    
    def self.activating_user(u_name)
       User.find_or_create_by(name: u_name)
    end  


    def browse_movies
        movies = Movie.all.map{|movie|movie.title}
        prompt = TTY::Prompt.new
        movie_choice = prompt.select("Choose a Movie", movies, filter: true)
        #purchase_movie(movie_choice)
    end

    def purchase_movie(selected_movie)
        selection = selected_movie
        prompt = TTY::Prompt.new
        buy = prompt.yes?("Would you like to purchase #{selection}?")
        if buy
            Ticket.create(user_id: User.find_by(name: self.name).id, movie_id: Movie.find_by(title: selection).id)
            false
        else
            false
        end
    end

    def view_ticket
        #user does not get tickets passed
        ##  Ticket.all.find_by(id: 1) #gives me the first user "Jason" with user_id & movie_id 1
        ##  User.all.find_by(id: 1) # gives me the first user "Jason" with  id (user_id in Tickets) 1
        tickets = self.tickets.all
        my_tickets = tickets.map{|ticket| "#{Movie.find_by(id: ticket.movie_id).title}: $#{Movie.find_by(id: ticket.movie_id).price}"}
        puts my_tickets
        my_tickets
    end

    def cancel_ticket_display
        prompt = TTY::Prompt.new
        ticket_list = self.view_ticket
        selected_movie = prompt.select("Choose a Movie", ticket_list, filter: true)
    end

    def cancel_ticket(selected_movie)
        selection = selected_movie
        selection = selection.split[0].gsub(":","")
        prompt = TTY::Prompt.new
        cancel = prompt.yes?("Would you like to cancel #{selection}?")
        if cancel
            ticket_to_cancel = Ticket.find_by(user_id: self.id, movie_id: Movie.find_by(title: selection).id)
            ticket_to_cancel.destroy
            false
        else
            false
        end
    end
end





 # if User.find_by(name: u_name)
        #     puts "Welcome back"
        #     self.name
        # else
        # User.create(name: u_name )
        #     puts "Welcome #{u_name}"
        #     self.name
        # end