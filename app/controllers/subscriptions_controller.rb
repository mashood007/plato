class SubscriptionsController < ApplicationController


  def details
  	if !params[:id].blank?
  		@subscription = Subscription.find(params[:id])
  	end
  end

  def calculate
  	@message = Bill.calculate params
  	render json:  @message
  end

end
