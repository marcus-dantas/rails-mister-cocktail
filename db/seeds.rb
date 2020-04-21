require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

url_cocktails = 'https://raw.githubusercontent.com/maltyeva/iba-cocktails/master/recipes.json'
cocktails_serialized = open(url_cocktails).read
cocktails = JSON.parse(cocktails_serialized)

Cocktail.delete_all

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

cocktails.each do |cocktail|
  Cocktail.create!(name: cocktail["name"],
                   glass: cocktail["glass"],
                   category:["category"],
                   preparation: cocktail["preparation"])
end

puts 'Finished!'
