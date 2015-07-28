class Merchant < ActiveRecord::Base
  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
end
