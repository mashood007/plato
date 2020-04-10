module OrganisationsHelper

	def border(first, subscription_type_id)
		first == subscription_type_id ? "bg-danger" : ""
	end

end
