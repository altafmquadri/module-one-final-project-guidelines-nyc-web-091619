require_relative '../config/environment'
ActiveRecord::Base.logger = nil #Logger.new(STDOUT)



my_app = CliApp.new 
my_app.run


