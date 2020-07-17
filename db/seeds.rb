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

#This was just three ingredients that I decided to create
Ingredient.create(name: 'lemon')
puts "created ingredient #{Ingredient.first.name}"
Ingredient.create(name: 'ice')
puts "created ingredient #{Ingredient.second.name}"
Ingredient.create(name: 'mint leaves')
puts "created ingredient #{Ingredient.third.name}"

#This is the iteration that is parsing the list
# of ingredients from a JSON file
# ingredients['drinks'].each do |ingredient|
#   Ingredient.create(
#     name: ingredient.dig["strIngredient1"]
#   )
#   puts "created ingredient #{Ingredient.name}"
# end

# ingredients.each do |ingredient|
#   Ingredient.create(
#     name: ingredient["ingredients"]
#   )
#   puts "created ingredient #{}"
# end

#This is an iteration to parse the drinks and preparation
cocktails.each do |cocktail|
  Cocktail.create!(name: cocktail["name"],
                   glass: cocktail["glass"],
                   category: cocktail["category"],
                   # ingredients: cocktail.dig["ingredients", "ingredient"],
                   preparation: cocktail["preparation"])
  puts "created cocktail #{Cocktail.name}"
end

puts 'Finished!'
