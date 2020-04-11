module SubscriptionsHelper
  
  def extra_users
  	@organisation = current_user.organisation
  	@subscription = @organisation.subscription
  	@subscription.blank? ? 0 : (@organisation.number_of_users - @subscription.minimum_users)
  end

  def number_of_boards
  	@boards = current_user.organisation.try(:number_of_boards) || 0
  	@boards > 0 ? @boards : 0
  end


end
