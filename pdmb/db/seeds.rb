# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Director.create(name: "Chan-wook Park", description: "Chan-wook Park was born on August 23, 1963 in Seoul, South Korea.", country: "South Korea", picture: "http://ia.media-imdb.com/images/M/MV5BMTgyODk3MTU5OV5BMl5BanBnXkFtZTcwMTc3NjcyMQ@@._V1_UY317_CR14,0,214,317_AL_.jpg")

Movie.create(name: "Oldboy", year: "2003", trailer: "2HkjrJ6IK5E", genre: "", country: "South Korea", director_id: 2)
Movie.create(name: "Sympathy for Lady Vengeance", year: "2005", trailer: "blAgspkgcZA", genre: "", country: "South Korea", director_id: 2)
Movie.create(name: "Sympathy for Mr. Vengeance", year: "2002", trailer: "UXdtyYRkB0k", genre: "", country: "South Korea", director_id: 2)