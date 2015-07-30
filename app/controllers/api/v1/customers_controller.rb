class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def index
    respond_with Customer.all
  end

  def random
    respond_with Customer.all.sample
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.where(find_params).first
  end

  def find_all
    respond_with Customer.where(find_params).all
  end

  def invoices
    respond_with Invoice.all.where(customer_id: params[:id])
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
    respond_with customer.merchants
  end

  private

  def find_params
    params.permit(:id, :first_name,
                  :last_name, :full_name,
                  :created_at, :updated_at)
  end
end
