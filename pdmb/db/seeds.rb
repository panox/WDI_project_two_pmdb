# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Director.create(name: "Pedro Almodóvar", description: "The most internationally acclaimed Spanish filmmaker since Luis Buñuel was born in a small town (Calzada de Calatrava) in the impoverished Spanish region of La Mancha. He arrived in Madrid in 1968, and survived by selling used items in the flea-market called El Rastro.", country: "Spain", picture: "http://ia.media-imdb.com/images/M/MV5BNTE0NTk3NTMxOV5BMl5BanBnXkFtZTYwMzMxMjkz._V1_UX214_CR0,0,214,317_AL_.jpg")

Movie.create(name: "The Skin I Live In", year: "2011", trailer: "EolQSTTTpI4", genre: "", country: "Spain", director_id: 3)
Movie.create(name: "Volver", year: "2006", trailer: "9L2AJmNoUgo", genre: "", country: "Spain", director_id: 3)
Movie.create(name: "Women on the Verge of a Nervous Breakdown", year: "1988", trailer: "PypMOEKJuh8", genre: "", country: "Spain", director_id: 3)