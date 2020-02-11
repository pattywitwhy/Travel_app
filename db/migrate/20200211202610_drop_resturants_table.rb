class DropResturantsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :resturants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
