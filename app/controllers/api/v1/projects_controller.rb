class Api::V1::ProjectsController < ActionController::API 
	def create
		@project = Project.new params
		@project.build
	end


end
