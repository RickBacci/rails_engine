class Api::V1::CustomersController < ApplicationController
#  before_action :downcase_names, only: [:find_all]

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
    respond_with Customer.find_by(find_params)
  end

  def find_all
    respond_with Customer.where(find_params).all
  end

  def invoices
    respond_with Invoice.where(customer_id: params[:id]).all
  end

  def transactions
    respond_with Customer.find(params[:id]).transactions
  end

  def favorite_merchant
  end

  private

  def find_params
    params.permit(:id, :first_name,
                  :last_name, :full_name,
                  :created_at, :updated_at)
  end

  def downcase_names
    params[:first_name].downcase! if params[:first_name]
    params[:last_name].downcase! if params[:last_name]
  end
end
