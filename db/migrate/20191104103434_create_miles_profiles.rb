class CreateMilesProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :miles_profiles do |t|
      t.string :programme
      t.integer :amount
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
