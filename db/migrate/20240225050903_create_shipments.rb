class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :partner_id
      t.string :status

      t.timestamps
    end
  end
end
