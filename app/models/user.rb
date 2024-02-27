class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, :class_name => 'Shipment', :foreign_key => 'user_id'
  has_many :delivery_partner_orders, :class_name => 'Shipment', :foreign_key => 'partner_id'
  has_many :addresses, as: :addressable, :dependent => :destroy
  accepts_nested_attributes_for :addresses, :allow_destroy => true, :reject_if     => :all_blank
  ADMIN = "Admin"
  PARTNER = "Partner"
  CUSTOMER = "Customer"

  def admin?
    self.role == ADMIN
  end

  def partner?
    self.role == PARTNER
  end

  def customer?
    self.role == CUSTOMER
  end
end

