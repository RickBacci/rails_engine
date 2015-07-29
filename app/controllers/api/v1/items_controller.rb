class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def random
    respond_with Item.all.sample
  end

  def show
    respond_with Item.find(params[:id])
  end

  def find
    respond_with Item.find_by(find_params)
  end

  def find_all
    respond_with Item.all.where(find_params)
  end

  def invoice_items
  end

  def merchant
  end

  def most_revenue
  end

  def most_items
  end

  def best_day
  end


  private

  def find_params
    params.permit(:name, :description, :unit_price)
  end
end
