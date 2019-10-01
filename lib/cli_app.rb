class CliApp
    def run
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
        username_obj = User.new
        inputted_name = gets.chomp
        username_obj.activating_user(inputted_name)
    end

    

    
end
