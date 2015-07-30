class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def invoice
    respond_with Transaction.find(params[:id]).invoice
  end
end
