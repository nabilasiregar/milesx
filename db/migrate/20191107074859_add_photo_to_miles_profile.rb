class AddPhotoToMilesProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :miles_profiles, :photo, :string
  end
end
