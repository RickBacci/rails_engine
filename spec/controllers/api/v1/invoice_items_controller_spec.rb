require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do

  describe "Get #all" do
    it "returns all records" do
      5.times do |c|
        InvoiceItem.create(quantity: c, unit_price: c)
      end

      get :index, format: :json

      expect(JSON.parse(response.body).size).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end

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
    it "returns invoice items with the same attributes" do

      InvoiceItem.create(quantity: 3, unit_price: 7)
      InvoiceItem.create(quantity: 5, unit_price: 7)
      InvoiceItem.create(quantity: 5, unit_price: 5)


      get :find_all, quantity: 5, format: :json

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoice" do
    it "returns the Invoice_items invoice" do
      invoice = Invoice.create!(status: 'shipped')
      invoice.invoice_items.create!(quantity: 5, unit_price: 1.00)
      invoice.invoice_items.create!(quantity: 5, unit_price: 1.00)
      invoice_item = invoice.invoice_items.first

      get :invoice, id: invoice_item.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #item" do
    it "returns the invoice_items item" do
      item = Item.create!(name: 'item', description: 'item description',
                          unit_price: 2.00)
      invoice = Invoice.create(status: 'shipped')

      invoice_item = InvoiceItem.create(quantity: 1, unit_price: 1.00, item_id: item.id, invoice_id: invoice.id)

      get :item, id: invoice_item.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end

