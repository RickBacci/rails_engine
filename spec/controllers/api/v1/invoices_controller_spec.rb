require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe "GET #random" do
    it "returns a random invoice" do
      20.times do |i|
        Invoice.create(status: "shipped#{i}")
      end

      duplicate_invoices = 0

      40.times do
        get :random, format: :json
        i1 = (JSON.parse(response.body)['status'])
        get :random, format: :json
        i2 = (JSON.parse(response.body)['status'])

        duplicate_invoices += 1 if i1 == i2
      end

      expect(duplicate_invoices).to be < 10
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns an Invoice" do
      invoice = Invoice.create!(status: 'shipped')

      get :show, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "returns an invoice with a query param" do
      invoice = Invoice.create!(status: 'shipped')

      get :find, id: invoice.id, format: :json

      expect(JSON.parse(response.body)['status']).to eq('shipped')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns all invoies with that attribute" do
       Invoice.create!(status: 'shipped')
       Invoice.create!(status: 'shipped')
       Invoice.create!(status: 'shipped')

      get :find_all, status: 'shipped', format: :json

      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #transactions" do
    it "returns the invoices transactions" do
      invoice = Invoice.create!(status: 'shipped')

      get :transactions, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoice_items" do
   it "returns the invoices invoice_items" do
      invoice = Invoice.create!(status: 'shipped')

      get :invoice_items, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #items" do
    it "returns the invoices items" do
      invoice = Invoice.create!(status: 'shipped')

      get :items, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #customer" do
    it "returns the customer for the invoice" do
      invoice = Invoice.create!(status: 'shipped')

      get :customer, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #merchant" do
    it "returns the invoices merchant" do
      merchant = Merchant.create(name: 'testy')
      invoice = Invoice.create!(status: 'shipped', merchant_id: merchant.id)

      get :merchant, id: invoice.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
