# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doc = Nokogiri::HTML(open("https://pokemon.alexonsager.net/"))
5.times do
     
    puts doc.at_css('[id="pk_img"]').attributes["src"]
end