# require_relative '../lib/movie.rb'

Movie.destroy_all
Ticket.destroy_all
User.destroy_all

star_wars = Movie.find_or_create_by(title: "Star Wars", genre: "Sci-Fi", price: 15, capacity: 20, seats_sold: 0)
back = Movie.find_or_create_by(title: "Love Actually", genre: "Romantic Comedy", price: 15, capacity: 20, seats_sold: 0)
terminator = Movie.find_or_create_by(title: "Terminator", genre: "Action", price: 15, capacity: 5, seats_sold: 0)
the_dark_knight = Movie.find_or_create_by(title: "The Dark Knight", genre: "Suspense", price: 15, capacity: 20, seats_sold: 0)
rocky = Movie.find_or_create_by(title: "Rocky", genre: "Drama", price: 15, capacity: 20, seats_sold: 0)
