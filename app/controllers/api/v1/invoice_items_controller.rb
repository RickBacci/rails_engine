class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def random
    respond_with InvoiceItem.all.sample
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.find_by(find_params)
  end

  def find_all
  end

  def invoice
  end

  def item
  end

  private

    def find_params
      params.permit(:quatity, :unit_price)
    end
end
