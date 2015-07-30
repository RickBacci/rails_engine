class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  validates :quantity, presence: true
  validates :unit_price, presence: true

  def line_total
    quantity * unit_price
  end
end
