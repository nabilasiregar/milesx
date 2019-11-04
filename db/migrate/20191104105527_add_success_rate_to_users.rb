class AddSuccessRateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :success_rate, :integer
  end
end
