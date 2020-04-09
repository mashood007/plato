module ApplicationHelper
	def users_within_limit?
		@organisation = current_user.organisation
		@organisation.number_of_users > @organisation.users.size
    end

    def boards_within_limit?
    	@organisation = current_user.organisation
		(@organisation.number_of_boards == -1) || (@organisation.number_of_boards > @organisation.boards.size)
    end

end
