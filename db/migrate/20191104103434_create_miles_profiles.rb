class CreateMilesProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :miles_profiles do |t|
      t.string :type
      t.integer :amount
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
