class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :request_id
      t.boolean :released

      t.timestamps
    end
  end
end
