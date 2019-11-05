class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.boolean :released
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
