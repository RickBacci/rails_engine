class Api::V1::MerchantsController < ApplicationController
  before_action :downcase_names, only: [:find_all]
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def random
    respond_with Merchant.all.sample
  end


  def show
    respond_with Merchant.find(params[:id])
  end

  def find
    respond_with Merchant.find_by(find_params)
  end

  def find_all
    respond_with Merchant.where(find_params).all
  end

  def items
    merchant_items = Merchant.find(params[:id]).items
    respond_with merchant_items.map { |item| item.id }.to_json
  end

  def invoices
    respond_with Merchant.find(params[:id]).invoices
  end

  private
  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

  def downcase_names
    params[:name].downcase!
  end
end

