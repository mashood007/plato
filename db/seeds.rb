# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@subscription = Subscription.create(:title => "Solo", :description => "$ 3.00/mo billed monthly per Board", :minimum_users => 1, :unlimited_boards => false, :board_cost => 3, :additional_users => false, :cost_per_add_user => 0, :basic_cost => 0)

@subscription = Subscription.create(:title => "Startup for 5 user licenses:", :description => "$20.00/mo billed monthly, $18.00/mo billed annually for unlimited Boards. Each additional user seat is $7.00/mo.", :minimum_users => 5, :unlimited_boards => true, :board_cost => 18, :additional_users => true, :cost_per_add_user => 7, :basic_cost => 20)

@subscription = Subscription.create(:title => "Business for 10 user licenses", :description => "$35.00/mo billed monthly, $32.00/mo billed annually for unlimited Boards. Each additional user seat is $6.00/mo.", :minimum_users => 10, :unlimited_boards => true, :board_cost => 32, :additional_users => true, :cost_per_add_user => 6, :basic_cost => 35)

@subscription = Subscription.create(:title => "Enterprise for 50 user licenses", :description => "$60.00/mo billed monthly, $55.00/mo billed annually for unlimited Boards. Each additional user seat is $4.00/mo.", :minimum_users => 50, :unlimited_boards => true, :board_cost => 55, :additional_users => true, :cost_per_add_user => 4, :basic_cost => 60)
