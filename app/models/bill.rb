class Bill

	def self.calculate params
	   @subscription = Subscription.find(params[:id])
	   case params[:id].to_i
	   	 when 1 
	   	 	solo params
	   	 when 2
	   	 	startup params
	   	 when 3
	   		enterprice params
	   end
	end

	def self.solo params
	  if params[:number_of_boards].to_i > 0
	  	 monthly = params[:number_of_boards].to_i*2
	  	 anual_pay = monthly * 12
	   	 {title: "calculated", message: "$#{monthly} for monthly, Anual cost is $#{anual_pay}"}
	  else
	  	{title: "error" , message: "Should have at least one board" }
	  end
	end


	def self.startup params
		number_of_users =  params[:number_of_users].to_i
		if number_of_users > 4
			basic_charge = 240 #20*12
			board_charge = 216 #18*12
			additional_charge = number_of_users > 5 ? ((number_of_users - 5) * 7*12) : 0
			anual_pay = basic_charge + board_charge + additional_charge
	   	    {title: "calculated", message: "Anual cost is $#{anual_pay}"}
		else
			{title: "error" , message: "Should have at least 5 users" }
		end
		
	end

	def self.enterprice params
		number_of_users =  params[:number_of_users].to_i
		if number_of_users > 19
			basic_charge = 720 #60*12
			board_charge = 660 #55*12
			additional_charge = number_of_users > 20 ? ((number_of_users - 20) * 6*12) : 0
			anual_pay = basic_charge + board_charge + additional_charge
	   	    {title: "calculated", message: "Anual cost is $#{anual_pay}"}
		else
			{title: "error" , message: "Should have at least 20 users" }
		end
		
	end

end