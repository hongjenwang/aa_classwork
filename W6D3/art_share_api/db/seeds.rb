# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
    {username:'David'},
    {username:'Prince'},
    {username:'Michael Jackson'},
    {username:'Picasso'},
    {username:'Dahli'}
])

artworks = Artwork.create([
    {title: 'Man coding', artist_id:1, image_url:'appacademy.com'},
    {title:'Purple rain', artist_id:2, image_url:'prince.com'},
    {title:'Beat it', artist_id:3, image_url:'ilikekids.com'},
    {title:'Weird shit', artist_id:4, image_url:'picasso.com'},
    {title:'mustache man', artist_id:5, image_url:'meltingclocks.com'}

])