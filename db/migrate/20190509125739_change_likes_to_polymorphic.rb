class ChangeLikesToPolymorphic < ActiveRecord::Migration[5.2]
  def change
    remove_index  'likes', name: 'index_likes_on_post_id'
    remove_column :likes, :post_id

    add_column    :likes, :likeable_id,   :integer
    add_column    :likes, :likeable_type, :string
    add_index     :likes, [:likeable_type, :likeable_id]
  end
end
