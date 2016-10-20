module Api
	module V1
		class PoliciesUsersRolesController < ApplicationController
			respond_to :json

			def show
				respond_with PoliciesUsersRole.find(params[:id])
			end
			def index
				respond_with PoliciesUsersRole.all()
			end
			def create
	        	@policies_users_roles = PoliciesUsersRole.new(policies_users_roles_params)
		        if	@policies_users_roles.save
		        	render json: @policies_users_roles, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @policies_users_roles.errors, errors: @policies_users_roles.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@policies_users_roles = PoliciesUsersRole.find(params[:id])
	          if @policies_users_roles.update(policies_users_roles_params)
	            render json: @policies_users_roles, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @policies_users_roles.errors, errors: @policies_users_roles.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def policies_users_roles_params
		        	params.require(:policies_users_roles).permit(:policy_id, :role_id, :submit_to_user, :approves_to_user,
		        		                                      :maximum_amount, :alternate_approver, :auto_approv)
		        end
		end
	end
end
