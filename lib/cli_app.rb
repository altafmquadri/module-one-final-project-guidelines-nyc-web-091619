class CliApp
    MENU_CHOICES = ["Browse Movies", "View Ticket", "Cancel Ticket", "Exit"].freeze

    def run
        heading
        login
        main_menu
    end

    def main_menu
        puts "\n \n \n"
        
        MENU_CHOICES.each.with_index{|choices, i| puts "#{i+1}. #{choices}"}
        puts "\n \n \n"
        main_menu_selection = gets.chomp.to_i
        if main_menu_selection == 1
            selected = @activated_user.browse_movies  
            @activated_user.purchase_movie(selected) ? @activated_user.purchase_movie(selected) : main_menu
        elsif main_menu_selection == 2
            @activated_user.view_ticket
        elsif main_menu_selection == 3
            selected = @activated_user.cancel_ticket_display
            @activated_user.cancel_ticket(selected) ? @activated_user.cancel_ticket(selected) : main_menu
            #binding.pry
        elsif main_menu_selection == 4
                puts "Goodbye!"
        else
            puts "Please select a command from 1 to 2!"
            main_menu
        end
    end

    def heading
        puts "\n" * 3
        puts "*" *28
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
    end

    def login
        inputted_name = gets.chomp
        @activated_user = User.activating_user(inputted_name)
        puts "\n" * 3
        puts "What would you like to do today #{@activated_user.name}?"
    end

    def exit_movie_menu
        prompt = TTY::Prompt.new 
    end

end #end of CLIapp