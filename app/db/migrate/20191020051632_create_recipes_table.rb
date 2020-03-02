class CreateRecipesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :time_to_cook
      t.integer :energy
      t.text :recipe
      t.string :image
      t.boolean :is_premium
      t.integer :category_id

      t.timestamps
    end
  end
end
