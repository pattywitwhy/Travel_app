class AddCityIDtoActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :city_id, :integer
  end
end
