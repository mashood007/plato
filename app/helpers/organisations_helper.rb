module OrganisationsHelper

	def border(first, subscription_type_id)
		first == subscription_type_id ? "border_red" : ""
	end

end
