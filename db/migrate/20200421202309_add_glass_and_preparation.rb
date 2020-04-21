class AddGlassAndPreparation < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :glass, :string
    add_column :cocktails, :preparation, :text
  end
end
