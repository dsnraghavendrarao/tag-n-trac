class AddNewColumnToShipment < ActiveRecord::Migration[7.1]
  def change
    add_column :shipments, :tracking_id, :string
  end
end
