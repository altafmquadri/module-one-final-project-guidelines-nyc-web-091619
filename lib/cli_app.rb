class CliApp
    MENU_CHOICES = ["Browse Movies", "Exit"].freeze

    def run
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
        # username_obj = User.new
        inputted_name = gets.chomp
        activated_user = User.activating_user(inputted_name)
    
        puts "What would you like to do today #{activated_user}?"
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
        if mms.between?(1, MENU_CHOICES.count)
            case mms
            when 1
                browse_movies
            when 2
                puts "2 is working"
            end
            
        else
            puts "Please select a command from 1 to 3!"
            main_menu
        end
    end
end


def browse_movies
movies = Movie.all.map{|movie|movie.title}
prompt = TTY::Prompt.new
movie_choice = prompt.select("Choose a Movie", movies, filter: true)
end