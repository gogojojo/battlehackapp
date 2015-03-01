class OrdersController < ApplicationController
  def new
  @client_token = Braintree::ClientToken.generate
  end
  def create
  config.logger = Logger.new(params[:number])
  @amount = params[:number]
  nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: @amount, 
    payment_method_nonce: nonce
  )
  redirect_to  event_path(params[:id])
  event = Event.find(params[:id])
  puts event.cost
  event.cost = (event.cost.to_f - @amount.to_f)
  index = event.participants.index(current_user.id.to_s)
  event.amount[index] = @amount 
  event.save
  end
end
