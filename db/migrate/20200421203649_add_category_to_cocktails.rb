class AddCategoryToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :category, :text
  end
end
