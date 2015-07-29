require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do

  describe "GET #random" do
    it "returns http success" do
      get :random
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      invoice = Invoice.create!(status: 'shipped')
      get :show, id: invoice.id, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #find" do
    it "returns http success" do
      get :find
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
