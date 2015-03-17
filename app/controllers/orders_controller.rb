class OrdersController < ApplicationController
  def new
  @client_token = Braintree::ClientToken.generate
  end
  def create
  @amount = params[:number]
  nonce = params[:payment_method_nonce]
  render action: :new and return unless nonce
  result = Braintree::Transaction.sale(
    amount: @amount, 
    payment_method_nonce: nonce
  )
  redirect_to  event_path(params[:id])
  event = Event.find(params[:id])
  index = event.participants.index(current_user.id.to_s)
  event.amount[index] = @amount 
  event.save
    if event.save
      UserNotifier.send_payment_receipt_email(@user).deliver
    end
  end
end
