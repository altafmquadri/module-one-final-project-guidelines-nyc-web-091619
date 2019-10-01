class CliApp
    def run
        puts "Welcome to our movie service"
        puts "*" *28
        puts "Please enter your username to begin: "
        get_user_name
    end

    def get_user_name
        name = gets.chomp
    end

    def activating_user
        get_user_name.create
    end
    
end