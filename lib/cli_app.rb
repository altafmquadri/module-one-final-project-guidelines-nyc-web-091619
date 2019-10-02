class CliApp
    MENU_CHOICES = ["Browse Movies", "Exit"].freeze

    def run
        puts "\n" * 3
        puts "*" *28
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
        
        inputted_name = gets.chomp
        @activated_user = User.activating_user(inputted_name)
    
        puts "What would you like to do today #{@activated_user}?"
        
        main_menu
        
        
        
    end

    def main_menu
        puts "\n \n \n"
        
        MENU_CHOICES.each.with_index{|choices, i| puts "#{i+1}. #{choices}"}
        puts "\n \n \n"
        main_menu_selection = gets.chomp.to_i
        mms_validator(main_menu_selection)
    end


    def mms_validator(mms)
        mms.to_i
        if mms == 1
            browse_movies
        elsif mms == 2
                puts "Goodbye!"
        else
            puts "Please select a command from 1 to 2!"
            main_menu
        end
    end

    def browse_movies
        movies = Movie.all.map{|movie|movie.title}
        prompt = TTY::Prompt.new
        movie_choice = prompt.select("Choose a Movie", movies << "Exit", filter: true)
        purchase_movie(movie_choice)
    end

    def purchase_movie(selected_movie)
        selection = selected_movie
        prompt = TTY::Prompt.new
        buy = prompt.yes?("Would you like to purchase #{selection}?")

        if buy
            thing = Ticket.create(user_id: User.find_by(name: @activated_user).id, movie_id: Movie.find_by(title: selection).id)
            thing.seat_number = thing.id
            thing.save
        else
            movie = browse_movies
            purchase_movie(movie) 
        end
    end

    def exit_movie_menu
        prompt = TTY::Prompt.new 
    end

end #end of CLIapp