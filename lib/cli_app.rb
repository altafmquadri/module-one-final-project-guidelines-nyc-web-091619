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
            @activated_user.purchase_movie(selected) ? @activated_user.purchase_movie(selected) : (puts "\n You've purchased #{selected}!"; main_menu) 
        elsif main_menu_selection == 2
            @activated_user.view_ticket
            puts "\nPress any key to continue:"
            gets.chomp
            main_menu
        elsif main_menu_selection == 3 
            selected = @activated_user.cancel_ticket_display
            if @activated_user.cancel_ticket(selected) 
                @activated_user.cancel_ticket(selected)  
                puts "\n You've cancelled your purchase of #{selected}."
            else 
                main_menu
            end
        elsif main_menu_selection == 4
                puts "Goodbye!"
        else
            puts "Please select a valid command from 1 to 4!"
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
end #end of CLIapp