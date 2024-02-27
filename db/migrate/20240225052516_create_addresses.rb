class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :address
      t.string :land_mark
      t.string :pincode
      t.string :city
      t.string :state
      t.string :phone
      t.string :source
      t.boolean :active
      t.references :addressable, polymorphic: true

      t.timestamps
    end
  end
end
