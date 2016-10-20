module Api
	module V1
		class UsersController < ApplicationController
			respond_to :json

			def show
				respond_with User.find(params[:id])
			end
			def index
				respond_with User.all()
			end
			def create
	        	@user = User.new(user_params)
		        if	@user.save
		        	render json: @user, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @user.errors, errors: @user.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@user = User.find(params[:id])
	          if @user.update(user_params)
	            render json: @user, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @user.errors, errors: @user.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        def destroy
	          if User.find(params.require(:id)).destroy
	            render nothing: true, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @user.errors, errors: @user.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def user_params
		        	params.require(:user).permit(:role_id, :email, :password, :confirm_password)
		        end
		end
	end
end
