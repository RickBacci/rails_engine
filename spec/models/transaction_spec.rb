require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:invoice) { Invoice.create!(status: 'shipped') }
  let(:transaction) { {credit_card_number: "4654405418249632",
                      result: "success",
                      created_at: "2012-03-27 14:54:09",
                      updated_at: "2012-03-27 14:54:09",
                      invoice_id: 1} }

  context 'is valid' do
    it 'with valid attributes' do
      test_invoice = invoice.transactions.new(transaction)
      expect(test_invoice).to be_valid
    end
  end

  context 'is invalid' do
    it 'without a result' do

      test_invoice = invoice.transactions.new(transaction)
      test_invoice.result = nil
      expect(test_invoice).to be_invalid
    end
  end
end
