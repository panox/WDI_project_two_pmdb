# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Director.create(name: "Kar Wai Wong", description: "Wong Kar-wai (born 17 July 1956) is a Hong Kong Second Wave filmmaker, internationally renowned as an auteur for his visually unique, highly stylised, emotionally resonant work", country: "China", picture: "http://ia.media-imdb.com/images/M/MV5BMTY4MTQyMjI4NV5BMl5BanBnXkFtZTcwNDk2MzQ2MQ@@._V1_UY317_CR1,0,214,317_AL_.jpg")

Movie.create(name: "In the Mood for Love", year: "2000", trailer: "BnFjSHQFVkA", genre: "", country: "China", director_id: 4)
Movie.create(name: "2046", year: "2004", trailer: "3Tz6KgPfeuk", genre: "", country: "China", director_id: 4)
Movie.create(name: "Chungking Express", year: "1994", trailer: "Bjd7PFf_TFw", genre: "", country: "China", director_id: 4)