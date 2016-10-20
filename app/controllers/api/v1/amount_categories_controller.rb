module Api
	module V1
		class AmountCategoriesController < ApplicationController
			respond_to :json

			def show
				respond_with AmountCategory.find(params[:id])
			end
			def index
				respond_with AmountCategory.all()
			end
			def create
	        	@amount_category = AmountCategory.new(amount_category_params)
		        if	@amount_category.save
		        	render json: @amount_category, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @amount_category.errors, errors: @amount_category.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@amount_category = AmountCategory.find(params[:id])
	          if @amount_category.update(amount_category_params)
	            render json: @amount_category, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @amount_category.errors, errors: @amount_category.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def amount_category_params
		        	params.require(:amount_category).permit(:name)
		        end
		end
	end
end
