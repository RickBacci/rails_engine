class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end
end
