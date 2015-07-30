class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def random
    respond_with Transaction.all.sample
  end

  def show
    respond_with Transaction.find(params[:id])
  end

  def find
    respond_with Transaction.find_by(find_params)
  end

  def find_all
    respond_with Transaction.where(find_params).all
  end

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end

  private

  def find_params
    params.permit(:id, :result, :credit_card_number,
                  :created_at, :updated_at, :invoice_id)
  end
end
