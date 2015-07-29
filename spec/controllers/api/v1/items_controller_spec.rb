require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do

  describe "GET #random" do
    it "returns http success" do
      get :random
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

  describe "GET #invoice_items" do
    it "returns http success" do
      get :invoice_items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #merchant" do
    it "returns http success" do
      get :merchant
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #most_revenue" do
    it "returns http success" do
      get :most_revenue
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #most_items" do
    it "returns http success" do
      get :most_items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #best_day" do
    it "returns http success" do
      get :best_day
      expect(response).to have_http_status(:success)
    end
  end

end
