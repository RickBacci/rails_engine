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
    respond_with Merchant.select { find_params }
  end

  private
    def find_params
      params.permit(:id, :name)
    end
end

