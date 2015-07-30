require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe "GET #invoice" do
    it "returns the transactions invoice" do
      invoice = Invoice.create(status: 'shipped')
      Transaction.create!(result: 'success', invoice_id: invoice.id)
      transaction = Transaction.first

      get :invoice, id: transaction.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

end
