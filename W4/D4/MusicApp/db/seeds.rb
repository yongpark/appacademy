# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


t1 = Track.create!(name: "You Shook Me All night long", album_id: 1, ord: 1, lyrics: "hi")
t2 = Track.create!(name: "Rock'n Roll ain't noise pollution", album_id: 1, ord: 2, lyrics: "hi")
t3 = Track.create!(name: "Drake is the best", album_id: 2, ord: 3, lyrics: "hi")
t4 = Track.create!(name: "Drake loves Drake", album_id: 2, ord: 4, lyrics: "hi")
t5 = Track.create!(name: "The Horse", album_id: 3, ord: 5, lyrics: "hi")
t6 = Track.create!(name: "Sand", album_id: 3, ord: 6, lyrics: "hi")
t7 = Track.create!(name: "Stones song 1", album_id: 3, ord: 7, lyrics: "hi")
t8 = Track.create!(name: "Stones song 2", album_id: 3, ord: 8, lyrics: "hi")
