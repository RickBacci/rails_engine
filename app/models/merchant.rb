class Merchant < ActiveRecord::Base
  before_save :downcase_names

  validates :name, presence: true

  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  private

  def downcase_names
    self.name = self.name.downcase
  end
end
