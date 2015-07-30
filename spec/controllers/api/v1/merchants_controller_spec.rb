require 'pry'
require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do

  describe "Get #all" do
    it "returns all records" do
      5.times do |c|
        Merchant.create(name: "merchant#{c}")
      end

      get :index, format: :json

      expect(JSON.parse(response.body).size).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #random" do
    it "returns a random merchant" do
      20.times do |x|
        Merchant.create(name: "merchant#{x}")
      end

      duplicate_merchants = 0

      40.times do
        get :random, format: :json
        m1 = (JSON.parse(response.body)['name'])
        get :random, format: :json
        m2 = (JSON.parse(response.body)['name'])

        duplicate_merchants += 1 if m1 == m2
      end

      expect(response).to have_http_status(:success)
      expect(duplicate_merchants).to be < 10
    end
  end

  describe "GET #show" do
    it "returns a merchant" do
      merchant = Merchant.create!(name: 'acme')

      get :show, id: merchant.id, format: :json

      expect(JSON.parse(response.body)['name']).to eq('acme')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "finds a merchant with a query param" do
      merchant = Merchant.create!(name: 'acme2')

      get :find,  id: merchant.id, format: :json

      expect(JSON.parse(response.body)['name']).to eq('acme2')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    it "returns all merchants with the same attribute" do

        Merchant.create(name: "merchant1")
        Merchant.create(name: "merchant1")
        Merchant.create(name: "Not_Merchant1")

      get :find_all, name: 'merchant1', format: :json

      expect(JSON.parse(response.body).size).to eq(2)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #items" do
    it "returns all merchants items" do

      Merchant.create(name: "merchant1")

      5.times do |c|
        Merchant.first.items.create(name: "name#{c}",description: "desc#{c}", unit_price: 1.00)
      end

      get :items, id: Merchant.first.id, format: :json

      expect(JSON.parse(response.body).size).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoices" do
    it "returns all merchants invoices" do

      Merchant.create(name: "merchant1")

      5.times do |c|
        Merchant.first.invoices.create(status: "shipped#{c}")
      end

      get :invoices, id: Merchant.first.id, format: :json

      expect(JSON.parse(response.body).size).to eq(5)
      expect(response).to have_http_status(:success)
    end
  end
end
