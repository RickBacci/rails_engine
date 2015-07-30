class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  validates :status, presence: true

  def invoice_total
    invoice_items.map { |invoice_item| invoice_item.line_total }.inject(:+)
  end
end
