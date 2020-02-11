class RemoveCityIdFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :city_id, :integer
  end
end
