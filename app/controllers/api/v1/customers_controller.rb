class Api::V1::CustomersController < ApplicationController
  respond_to :json


  def random
    respond_with Customer.all.sample
  end

  def show
    respond_with Customer.find(params[:id])
  end

  def find
    respond_with Customer.find_by(find_params)
  end

  def find_all
    params[:first_name].downcase! if params[:first_name]
    params[:last_name].downcase! if params[:last_name]
    # respond_with Customer.where("lower(params[:first_name]) =?", params[:first_name].downcase).first
    respond_with Customer.all.where(find_params)
  end

  def invoices
    respond_with Invoice.all.where(customer_id: params[:id])
  end

  def transactions
    customer = Customer.find(params[:id])
    respond_with customer.invoices.transactions.where(result: 'success')
  end

  def favorite_merchant
    respond_with customer.merchants
  end

  private

    def find_params
      params.permit(:first_name, :last_name)
    end
end
