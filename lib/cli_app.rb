class CliApp
    # create an array of choices the user can do that will display data as a numbered list
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
        # As a user I want to be able to browse movies
        if main_menu_selection == 1
            selected = @activated_user.browse_movies
            # use this condition to address a browser not purchasing a movie
            # As a user I want to be able to select a movie and purchase it
            if @activated_user.purchase_movie(selected)
                @activated_user.purchase_movie(selected) 
            else
                main_menu
            end
        elsif main_menu_selection == 2
            # condition to address a user not having any tickets
            # As a user I want to be ablle to view ticket data
            if Ticket.find_by(user_id: @activated_user.id)
                @activated_user.view_ticket
                puts "\nPress any key to continue:"
                gets.chomp
                main_menu
            else
                puts "You do not have any tickets to view!"
                main_menu
            end
        elsif main_menu_selection == 3 
            selected = @activated_user.cancel_ticket_display
            # this condition applies to a user trying to cancel a ticket
            # when there are no purchased tickets
            # As a user I want to be able to cancel the ticket 
            if selected && @activated_user.cancel_ticket(selected)
                @activated_user.cancel_ticket(selected) 
                main_menu
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
        #As a user I want to be able to see a welcome message
        puts "\n" * 3
        puts "*" *28
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
    end

    def login
        #As as user I want to be able to create an account
        inputted_name = gets.chomp
        @activated_user = User.activating_user(inputted_name)
        puts "\n" * 3
        puts "What would you like to do today #{@activated_user.name}?"
    end
end #end of CLIapp