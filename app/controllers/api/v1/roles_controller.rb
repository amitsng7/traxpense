module Api
	module V1
		class RolesController < ApplicationController
			respond_to :json

			def show
				respond_with Role.find(params[:id])
			end
			def index
				respond_with Role.all()
			end
			def create
	        	@role = Role.new(role_params)
		        if	@role.save
		        	render json: @role, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @role.errors, errors: @role.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@role = Role.find(params[:id])
	          if @role.update(role_params)
	            render json: @role, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @role.errors, errors: @role.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def role_params
		        	params.require(:role).permit(:name)
		        end
		end
	end
end
