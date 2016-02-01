class AddPhotoIdToCards < ActiveRecord::Migration
  def change
    add_column :cards, :photo_id, :integer
  end
end
