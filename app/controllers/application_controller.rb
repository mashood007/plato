class ApplicationController < ActionController::Base
before_action :authenticate_user!

	def check_org
	 	if current_user.organisation_id.blank?
    		redirect_to alter_organisations_url
    	elsif current_user.organisation.subscription_id.blank?
    		redirect_to plan_choice_organisations_url
    	end
	end 

	def users_within_limit?
		@organisation = current_user.organisation
		@organisation.number_of_users > @organisation.users.size
    end


    def boards_within_limit?
    	@organisation = current_user.organisation
		 (@organisation.number_of_boards == -1) || (@organisation.number_of_boards > @organisation.boards.size)
    end

    def authenticate_board
      redirect_to(boards_url) if @board.organisation_id != current_user.organisation_id
    end

    def check_admin_user
    	redirect_to(home_index_url) if current_user.normal_user
    end

end
