class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def random
    respond_with Invoice.all.sample
  end

  def show
    respond_with Invoice.find(params[:id])
  end

  def find
    respond_with Invoice.find_by(find_params)
  end

  def find_all
    respond_with Invoice.all.where(find_params)
  end

  def transactions
  end

  def invoice_items
  end

  def items
  end

  def customer
  end

  def merchant
  end

  private

  def find_params
    params.permit(:status)
  end
end
