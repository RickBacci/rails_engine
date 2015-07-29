require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do

  describe "GET #random" do
    it "returns http success" do
      get :random
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
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

  describe "GET #invoices" do
    it "returns http success" do
      get :invoices
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #transactions" do
    it "returns http success" do
      get :transactions
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #favorite_merchant" do
    it "returns http success" do
      get :favorite_merchant
      expect(response).to have_http_status(:success)
    end
  end

end
