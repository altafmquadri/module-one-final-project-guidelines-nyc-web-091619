class CliApp
    def run
        puts "sup, what's your name? "
        get_user_name
    end

    def get_user_name
        name = gets.chomp
    end
    
end