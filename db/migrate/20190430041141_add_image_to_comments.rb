class AddImageToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :image_data, :text
  end
end
