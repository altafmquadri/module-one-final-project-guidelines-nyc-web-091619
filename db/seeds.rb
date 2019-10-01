# require_relative '../lib/movie.rb'

star_wars = Movie.find_or_create_by(title: "Star Wars", genre: "Sci-Fi", price: 1, capacity: 20)
back = Movie.find_or_create_by(title: "Love Actually", genre: "Romantic Comedy", price: 1, capacity: 20)
terminator = Movie.find_or_create_by(title: "Terminator", genre: "Action", price: 1, capacity: 20)
the_dark_knight = Movie.find_or_create_by(title: "The Dark Knight", genre: "Suspense", price: 1, capacity: 20)
rocky = Movie.find_or_create_by(title: "Rocky", genre: "Drama", price: 1, capacity: 20)
