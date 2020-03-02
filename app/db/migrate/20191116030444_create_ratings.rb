class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.integer :rate
      t.timestamps
    end
  end
end
