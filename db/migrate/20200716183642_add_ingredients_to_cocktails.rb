class AddIngredientsToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :ingredient, :text
  end
end
