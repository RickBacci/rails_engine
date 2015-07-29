require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe "GET #random" do
    it "returns a random invoice" do
      20.times do |i|
        Invoice.create(status: "shipped#{c}")
      end

      duplicate_ivoices = 0

      40.times do
        get :random, format: :json
        c1 = (JSON.parse(response.body)['status'])
        get :random, format: :json
        c2 = (JSON.parse(response.body)['status'])

        duplicate_invoices += 1 if i1 == i2
      end



      expect(duplicate_ivoices).to be < 10
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
    it "returns a customer with a query param" do
      invoice = Invoice.create!(status: 'shipped')

      get :find, id: invoice.id, format: :json

      expect(JSON.parse(response.body)['status']).to eq('shiped')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns http success" do
      get :find_all
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #transactions" do
    it "returns http success" do
      get :transactions
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoice_items" do
    it "returns http success" do
      get :invoice_items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #items" do
    it "returns http success" do
      get :items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #customer" do
    it "returns http success" do
      get :customer
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #merchant" do
    it "returns http success" do
      get :merchant
      expect(response).to have_http_status(:success)
    end
  end

end
