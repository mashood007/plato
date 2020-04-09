# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  	@subscription = Subscription.create(:title => "Solo", :description => "$ 2.00/mo billed monthly per Board", :number_of_users => 1, :monthly_rate => 2.00)
  	@subscription = Subscription.create(:title => "Startup", :description => "$20.00/mo billed monthly, $18.00/mo billed
annually for unlimited Boards. Each additional user seat is $7.00/mo.", :number_of_users => 5, :monthly_rate => 20.00, :additional_user_rate => 7.00, :unlimited_board_rate => 18)
  	@subscription = Subscription.create(:title => "Enterprise", :description => "$60.00/mo billed monthly, $55.00/mo
billed annually for unlimited Boards. Each additional user seat is $6.00/mo.:", :number_of_users => 20, :monthly_rate => 60.00, :additional_user_rate => 6.00, :unlimited_board_rate => 55.00)

