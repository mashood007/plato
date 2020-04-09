class Project
  
  def initialize params
  	@params = params
  end

  def build
  	@organisation = OrganisationBuilder.create @params[:project]

  	(0...@organisation.number_of_users.to_i).each do |index|
  		@user = UserBuilder.create @params[:project][:users]["#{index}"], @organisation.id
  	 end
  end

end

class OrganisationBuilder 

  def self.create params
  	@organisation = Organisation.create(org_params(params))
  	@organisation
  end

  def self.org_params params
  	params.require(:organisation).permit( :name, :location, :subscription_id, :number_of_users, :number_of_boards)
  end

end

class UserBuilder
  
  def self.create params, organisation_id
  	params[:user][:organisation_id] = organisation_id
  	@user = User.new user_params(params)
  	@user.save
  end

  def self.user_params params
    params.require(:user).permit(:name, :email, :password, :normal_user, :organisation_id)
  end
end