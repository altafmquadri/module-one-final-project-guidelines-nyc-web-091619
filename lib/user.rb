class User < ActiveRecord::Base
    def self.activating_user(name)
        if User.find_by(name: name)
            puts "Welcome back"
            name
        else
        User.create(name: name )
            puts "Welcome #{name}"
            name
        end
    end

    

    
end