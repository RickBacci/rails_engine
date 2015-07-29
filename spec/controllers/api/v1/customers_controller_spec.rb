require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #random" do
    it "returns a random customer" do
      20.times do |c|
        Customer.create(first_name: "first_name#{c}",last_name: "last_name#{c}")
      end

      duplicate_customers = 0

      40.times do
        get :random, format: :json
        c1 = (JSON.parse(response.body)['first_name'])
        get :random, format: :json
        c2 = (JSON.parse(response.body)['first_name'])

        duplicate_customers += 1 if c1 == c2
      end

      expect(duplicate_customers).to be < 10
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a Customer" do
      customer = Customer.create!(first_name: 'Ricky', last_name: 'B')

      get :show, id: customer.id, format: :json

      expect(JSON.parse(response.body)['first_name']).to eq('Ricky')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "returns a Customer with a query param" do
      customer = Customer.create!(first_name: 'Ricky', last_name: 'B')

      get :find, id: customer.id, format: :json

      expect(JSON.parse(response.body)['last_name']).to eq('B')
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find_all" do
    xit "returns all customers with the same attribute" do

      Customer.create!(first_name: 'Ricky', last_name: 'B')
      Customer.create!(first_name: 'Ricky', last_name: 'B')
      Customer.create!(first_name: 'ricky', last_name: 'b')

      get :find_all, first_name: 'Ricky', case_sensitive: false, format: :json


      expect(JSON.parse(response.body).size).to eq(3)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #invoices" do
    xit "returns http success" do
      get :invoices
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #transactions" do
    xit "returns http success" do
      get :transactions
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #favorite_merchant" do
    xit "returns http success" do
      get :favorite_merchant
      expect(response).to have_http_status(:success)
    end
  end

end
