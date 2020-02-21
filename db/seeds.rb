require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts 'Cleaning DB'
Ingredient.destroy_all

puts 'Generating new DB'
Ingredient.create(name: 'lemon')
Ingredient.create(name: 'ice')
Ingredient.create(name: 'mint leaves')
ingredients['drinks'].each do |ingredient|
  Ingredient.create(
    name: ingredient['strIngredient1']
  )
  puts "created ingredient #{Ingredient.name}"
end

100.times do Cocktail.create(
  name: Faker::Beer.name
  )
end

puts 'Finished!'
