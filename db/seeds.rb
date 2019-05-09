# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alex = User.create(:username => "Alex_the_King", :password => 'king123')

fighting = Genre.create(:title => 'Fighting')

kof = Game.create(:title => "King of Fighters 98", :publisher => 'SNK', :release_date => '1998')

sf2 = Game.create(:title => 'Street Fighter 2', :publisher => 'Capcom', :release_date => '1992')

kof.genre = fighting 
kof.save
sf2.genre = fighting
sf2.save
alex.games << kof 
alexs.games << sf2