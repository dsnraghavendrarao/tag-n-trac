class Shipment < ApplicationRecord
  has_many :addresses, as: :addressable, :dependent => :destroy
  belongs_to :partner, class_name: "User", foreign_key: 'partner_id'
  belongs_to :user
  accepts_nested_attributes_for :addresses
  validates :user_id, :name, :description, :partner_id, presence: true


  enum status: {
    review: 0,
    accpet: 1,
    transit: 2,
    delivered: 3 
  }


  before_create :change_status
  def change_status
  	self.status = :review
    self.tracking_id = generate_code
  end

  def generate_code
    loop do 
      code = rand(10000000..99999999)
      break code unless Shipment.where(tracking_id: code).exists?
    end
  end

  def from_address
    addresses.where(source: "From").last
  end

  def to_address
    addresses.where(source: "To").last
  end
end
