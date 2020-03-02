class CreatePremiumPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :premium_purchases do |t|
      t.integer :user_id
      t.datetime :expries_at

      t.timestamps
    end
  end
end
  