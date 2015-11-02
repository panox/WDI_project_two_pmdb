# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Director.create(id: 1, name: "Jim Jarmusch", description: "Moved to New York City at the age of seventeen fro...", country: "USA", picture: "http://ia.media-imdb.com/images/M/MV5BMTYyODUwNDA2...") 
Director.create(id: 2, name: "Chan-wook Park", description: "Chan-wook Park was born on August 23, 1963 in Seou...", country: "South Korea", picture: "http://ia.media-imdb.com/images/M/MV5BMTgyODk3MTU5...") 
Director.create(id: 3, name: "Pedro Almodóvar", description: "The most internationally acclaimed Spanish filmmak...", country: "Spain", picture: "http://ia.media-imdb.com/images/M/MV5BNTE0NTk3NTMx...") 
Director.create(id: 4, name: "Kar Wai Wong", description: "Wong Kar-wai (born 17 July 1956) is a Hong Kong Se...", country: "China", picture: "http://ia.media-imdb.com/images/M/MV5BMTY4MTQyMjI4...")

Movie.create(name: "In the Mood for Love", year: "2000", trailer: "BnFjSHQFVkA", genre: "", country: "China", director_id: 4)
Movie.create(name: "2046", year: "2004", trailer: "3Tz6KgPfeuk", genre: "", country: "China", director_id: 4)
Movie.create(name: "Chungking Express", year: "1994", trailer: "Bjd7PFf_TFw", genre: "", country: "China", director_id: 4)