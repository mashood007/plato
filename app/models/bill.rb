class Bill

	def initialize params
		@number_of_users = params[:number_of_users].to_i
		@number_of_boards = params[:number_of_boards].to_i
		@subscription = Subscription.find(params[:id])
	end

	def message
		if !@subscription.unlimited_boards && @number_of_boards < 1
			{title: "error" , message: "Should have at least one board" }
		else
			total_cost
		end
	end

	def anual_cost   
	   board_cost =  @subscription.unlimited_boards ? unlimited_board_cost : limited_boards
	   users_cost = @subscription.additional_users ? additional_users_cost : 0
	   basic_cost + board_cost + users_cost
	end

	def unlimited_board_cost
		@subscription.board_cost * 12
	end

	def limited_boards
		@subscription.board_cost * @number_of_boards * 12
	end

	def basic_cost
		@subscription.basic_cost * 12
	end

	def additional_users_cost
		@number_of_users > 0 ? (@number_of_users * @subscription.cost_per_add_user * 12 ) : 0
	end

	def total_cost
		{title: "calculated", message: "Anual Total Cost is $#{anual_cost}"}
	end


end