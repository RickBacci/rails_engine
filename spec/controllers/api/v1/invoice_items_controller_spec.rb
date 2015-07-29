require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  describe "GET #random" do
    it "returns a random InvoiceItem" do
      20.times do |i|
        InvoiceItem.create(quantity: i, unit_price: i)
      end

      duplicate_invoice_items = 0

      40.times do
        get :random, format: :json
        i1 = (JSON.parse(response.body)['quantity'])
        get :random, format: :json
        i2 = (JSON.parse(response.body)['quantity'])

        duplicate_invoice_items += 1 if i1 == i2
      end

      expect(duplicate_invoice_items).to be < 10
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns an InvoiceItem" do
      invoice_item = InvoiceItem.create!(quantity: 5, unit_price: 1.00)
      get :show, id: invoice_item.id, format: :json


      expect(JSON.parse(response.body)['quantity']).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "returns an InvoiceItem with a query param" do
      invoice_item = InvoiceItem.create!(quantity: 5, unit_price: 1.00)

      get :find, id: invoice_item.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns http success" do
      get :find_all
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoice" do
    it "returns http success" do
      get :invoice
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #item" do
    it "returns http success" do
      get :item
      expect(response).to have_http_status(:success)
    end
  end

end
