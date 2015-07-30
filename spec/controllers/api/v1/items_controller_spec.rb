require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #random" do
    it "returns a random item" do
      20.times do |c|
        Item.create(name: "name#{c}",description: "desc#{c}", unit_price: 1.00)
      end

      duplicate_items = 0

      40.times do
        get :random, format: :json
        c1 = (JSON.parse(response.body)['name'])
        get :random, format: :json
        c2 = (JSON.parse(response.body)['name'])

        duplicate_items += 1 if c1 == c2
      end

      expect(duplicate_items).to be < 10
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns an Item" do
      item = Item.create!(name: 'item', description: 'item description',
                          unit_price: 2.00)

      get :show, id: item.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "returns an item with a query param" do
      item = Item.create!(name: 'item', description: 'item description',
                          unit_price: 2.00)
      get :find, id: item.id, format: :json

      expect(JSON.parse(response.body)['name']).to eq('item')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns all of the items with the same attribute" do

      Item.create(name: "name",description: "desc", unit_price: 1.00)
      Item.create(name: "name",description: "desc", unit_price: 1.00)
      Item.create(name: "name",description: "desc_diff", unit_price: 1.00)

      get :find_all, name: 'name', format: :json

      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(:success)

      get :find_all, description: 'desc', format: :json
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET #invoice_items" do
    it "returns the items invoice_items" do

      item = Item.create!(name: 'item', description: 'item description',
                          unit_price: 2.00)
      invoice = Invoice.create!(status: 'shipped')

      invoice.invoice_items.create!(quantity: 5, unit_price: 1.00, item_id: item.id)
      invoice.invoice_items.create!(quantity: 5, unit_price: 1.00, item_id: item.id)

      invoice_item = invoice.invoice_items.first

      get :invoice_items, id: item.id, format: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #merchant" do
    it "returns the items merchant" do
      Merchant.create(name: 'testy')
      Merchant.first.items.create(name: 'bouncy ball', description: 'ball',
                                  unit_price: 3.00)
      item = Item.first
      get :merchant, id: item.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end
end
