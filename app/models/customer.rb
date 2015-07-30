class Customer < ActiveRecord::Base
  before_save :downcase_names

  validates :first_name, :last_name, presence: true

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants,    through: :invoices

  private

  def downcase_names
    self.first_name = self.first_name.downcase
    self.last_name = self.last_name.downcase
  end
end
