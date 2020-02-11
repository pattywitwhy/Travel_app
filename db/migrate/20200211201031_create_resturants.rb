class CreateResturants < ActiveRecord::Migration[6.0]
  def change
    create_table :resturants do |t|
      t.string :name
      t.string :location
      t.text :blog

      t.timestamps
    end
  end
end
