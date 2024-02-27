json.extract! shipment, :id, :user_id, :item_id, :partner_id, :status, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
