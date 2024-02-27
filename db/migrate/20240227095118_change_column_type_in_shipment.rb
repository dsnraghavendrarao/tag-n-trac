class ChangeColumnTypeInShipment < ActiveRecord::Migration[7.1]
  def change
    change_column :shipments, :status, :integer, using: 'status::integer', default: 0
  end
end
