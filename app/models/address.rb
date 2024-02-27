class Address < ApplicationRecord
  belongs_to :addressable, :polymorphic => true
  # validates :pincode, format: { with: /\A\d{5}\z/, message: "should be 5 digits" }
  # validates :phone, format: { with: /\A\d{10}\z/, message: "should be 10 digits" }
  validates :name, :address, :land_mark, :city, :state, presence: true
end
