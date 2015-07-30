class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def random
    respond_with Item.all.sample
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.where(find_params).first
  end

  def find_all
    respond_with Item.where(find_params).all
  end

  def invoice_items
    respond_with Item.invoice_items
  end

  def merchant
    respond_with Item.merchant
  end

  def most_revenue
  end

  def most_items
  end

  def best_day
  end


  private

  def find_params
    params.permit(:id, :name, :description, :unit_price,
                  :merchant_id, :created_at, :updated_at)
  end
end
