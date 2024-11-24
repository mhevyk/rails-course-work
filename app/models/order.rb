class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :name, :email, :phone, :address, :delivery_method, :payment_method, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

end
