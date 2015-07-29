class Api::V1::MerchantsController < ApplicationController
  respond_to :json

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
    respond_with Merchant.all.where(name: params['name'].downcase!)
  end

  def items
    merchant_items = Merchant.find(params[:id]).items
    respond_with merchant_items.map { |item| item.id }.to_json
  end

  def invoices
    merchant_invoices = Merchant.find(params[:id]).invoices
    merchant_invoices = merchant_invoices.map { |invoice| invoice.id }

    respond_with merchant_invoices.to_json
  end

  private
    def find_params
      params.permit(:id, :name)
    end
end

