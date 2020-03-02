class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id	
      t.string :name
      t.integer :amount
      t.string :unit
      
      t.timestamps
    end
  end
end
