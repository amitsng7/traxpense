module Api
	module V1
		class PoliciesController < ApplicationController
			respond_to :json

			def show
				respond_with Policy.find(params[:id])
			end
			def index
				respond_with Policy.all()
			end
			def create
	        	@policy = Policy.new(policy_params)
		        if	@policy.save
		        	render json: @policy, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @policy.errors, errors: @policy.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@policy = Policy.find(params[:id])
	          if @policy.update(policy_params)
	            render json: @policy, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @policy.errors, errors: @policy.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def policy_params
		        	params.require(:policy).permit(:name, :owner_email, :type)
		        end
		end
	end
end
