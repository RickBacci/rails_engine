class Transaction < ActiveRecord::Base
  belongs_to :invoice

  validates :result, presence: true
end
