class SubscriptionsController < ApplicationController


  def details
  	@subscription = Subscription.find(params[:id])
  end

  def calculate
  	@bill = Bill.new(params)
  	render json:  @bill.message
  end

end
