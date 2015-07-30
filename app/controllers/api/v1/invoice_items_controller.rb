class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    respond_with InvoiceItem.all
  end

  def random
    respond_with InvoiceItem.all.sample
  end

  def show
    respond_with InvoiceItem.find(params[:id])
  end

  def find
    respond_with InvoiceItem.where(find_params).first
  end

  def find_all
    respond_with InvoiceItem.where(find_params).all
  end

  def invoice
    invoice_item = InvoiceItem.find(params[:id])
    respond_with Invoice.where(invoice_item.invoice_id).first
  end

  def item
    invoice_item = InvoiceItem.find(params[:id])
    respond_with Item.where(invoice_item.item_id).first
  end

  private

    def find_params
      params.permit(:id, :quantity, :unit_price,
                    :created_at, :updated_at,
                    :invoice_id, :item_id)
    end
end
