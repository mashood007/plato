class OrganisationsController < ApplicationController

	before_action :set_subscription, only: [:subscribed]

	def new
		@organisation = Organisation.new
		@organisation.users.build
	end

	def alter
		@organisation = Organisation.new
	
	end

	def edit

	end

	def create
		@organisation = Organisation.new(organisations_params)
	    respond_to do |format|
	      if @organisation.save
	      	if current_user.present?
	      		current_user.organisation_id = @organisation.id
	      		current_user.save
	      	end
	        format.html { redirect_to plan_choice_organisations_url, notice: 'User was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end			
	end	

	def update

	end

	def plan_choice
		@subscriptions = Subscription.all
		@organisation = current_user.organisation
	end

	def subscribed
    	@organisation = current_user.organisation
    	if subscribe_params[:number_of_users] < @organisation.users.size
    	   redirect_to home_index_url , notice: 'You have more users than that you described'    		
        else
	      if @organisation.update(subscribe_params)
	        redirect_to home_index_path
	      end
       end
    end


private
 
  def organisations_params
      params.require(:organisation).permit( :name, :location, users_attributes: [ :id, :name, :email, :password, :role])
    end

  def subscribe_params
  	params[:subscribe][:number_of_boards] == -1 if @subscription.unlimited_boards
  	params[:subscribe][:number_of_users] = !@subscription.additional_users ? @subscription.minimum_users  : (params[:subscribe][:number_of_users].to_i+@subscription.minimum_users)
  	params.require(:subscribe).permit(:id, :subscription_id, :number_of_boards, :number_of_users)
  end

  def set_subscription
  	@subscription = Subscription.find(params[:subscribe][:subscription_id])
  end


end
