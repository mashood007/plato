namespace :subscriptions do
  desc "add values to the subscriptions"
  task add_values: :environment do
  	@subscription = Subscription.create(:title => "test")
  end

end
