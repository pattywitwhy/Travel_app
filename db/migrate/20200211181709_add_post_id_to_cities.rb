class AddPostIdToCities < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :post_id, :integer
  end
end
