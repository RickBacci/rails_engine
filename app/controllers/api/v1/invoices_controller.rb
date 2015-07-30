class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.all
  end

  def random
    respond_with Invoice.all.sample
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.find_by(find_params).first
  end

  def find_all
    respond_with Invoice.where(find_params).all
  end

  def transactions
    respond_with Invoice.transactions
  end

  def invoice_items
    respond_with Invoice.invoice_items
  end

  def items
    respond_with Invoice.items
  end

  def customer
    respond_with Invoice.customer
  end

  def merchant
    respond_with Invoice.customer
  end

  private

    def find_params
      params.permit(:id, :status, :created_at,
                    :updated_at, :customer_id, :merchant_id)
    end
end
