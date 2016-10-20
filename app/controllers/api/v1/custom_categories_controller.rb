module Api
	module V1
		class CustomCategoriesController < ApplicationController
			respond_to :json

			def show
				respond_with CustomCategory.find(params[:id])
			end
			def index
				respond_with CustomCategory.all()
			end
			def create
	        	@custom_category = CustomCategory.new(custom_category_params)
		        if	@custom_category.save
		        	render json: @custom_category, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @custom_category.errors, errors: @custom_category.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@custom_category = CustomCategory.find(params[:id])
	          if @custom_category.update(custom_category_params)
	            render json: @custom_category, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @custom_category.errors, errors: @custom_category.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def custom_category_params
		        	params.require(:custom_category).permit(:policy_id, :name, :gl_code, :payroll_code, :max_amt_cat,
		        		:max_amt, :receipt, :comment)
		        end
		end
	end
end
