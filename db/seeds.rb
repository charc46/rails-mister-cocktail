# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'


# Seed ingredients
Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data = JSON.parse(open(url).read)
data['drinks'].each { |i| Ingredient.create!(name: i.values[0]) }
Ingredient.create(name: 'Mint')
Ingredient.create(name: 'Egg White')
Ingredient.create(name: 'Soda Water')
