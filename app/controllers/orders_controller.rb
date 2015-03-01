class OrdersController < ApplicationController
  def new
  @client_token = Braintree::ClientToken.generate
  end
  def create
  @params = params[:number]
    nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: @params, 
    payment_method_nonce: nonce
  )
  redirect_to new_order_path 
  end
end
