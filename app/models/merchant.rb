class Merchant < ActiveRecord::Base
#  before_save :downcase_names

  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
    invoices.map { |invoice| invoice.invoice_total }.inject(:+).as_json
  end

  private

  # def downcase_names
  #   self.name = self.name.downcase
  # end
end
