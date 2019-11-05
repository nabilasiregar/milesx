class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :confirmed
      t.string :photo
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
