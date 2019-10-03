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

end





 # if User.find_by(name: u_name)
        #     puts "Welcome back"
        #     self.name
        # else
        # User.create(name: u_name )
        #     puts "Welcome #{u_name}"
        #     self.name
        # end