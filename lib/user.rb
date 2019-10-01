class User < ActiveRecord::Base
    def activating_user(name)
        if User.find_by(name: name)
            puts "Welcome back #{name}"
        else
        User.create(name: name )
            puts "Welcome #{name}"
        end
    end
end