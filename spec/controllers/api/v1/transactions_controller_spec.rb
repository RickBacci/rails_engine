require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do

  describe "GET #random" do
    it "returns a random transaction" do
      20.times do |x|
        Transaction.create(result: "success#{x}")
      end

      duplicate_transactions = 0

      40.times do
        get :random, format: :json
        m1 = (JSON.parse(response.body)['result'])
        get :random, format: :json
        m2 = (JSON.parse(response.body)['result'])

        duplicate_transactions += 1 if m1 == m2
      end

      expect(response).to have_http_status(:success)
      expect(duplicate_transactions).to be < 10
    end
  end

  describe "GET #show" do
    it "returns a transaction" do
      transaction = Transaction.create!(result: 'success')

      get :show, id: transaction.id, format: :json

      expect(JSON.parse(response.body)['result']).to eq('success')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "finds a transaction with a query param" do
      transaction = Transaction.create!(result: 'success')

      get :show, id: transaction.id, format: :json

      expect(JSON.parse(response.body)['result']).to eq('success')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns all transactions with the same attribute" do

      Transaction.create(result: "transaction1")
      Transaction.create(result: "transaction1")

      get :find_all, name: 'transaction1', format: :json

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:success)
    end

  end
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
