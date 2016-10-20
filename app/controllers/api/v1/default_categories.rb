module Api
	module V1
		class DefaultCategoriesController < ApplicationController
			respond_to :json

			def show
				respond_with DefaultCategory.find(params[:id])
			end
			def index
				respond_with DefaultCategory.all()
			end
			def create
	        	@default_category = DefaultCategory.new(default_category_params)
		        if	@default_category.save
		        	render json: @default_category, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @default_category.errors, errors: @default_category.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@default_category = DefaultCategory.find(params[:id])
	          if @default_category.update(default_category_params)
	            render json: @default_category, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @default_category.errors, errors: @default_category.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def default_category_params
		        	params.require(:default_category).permit(:name)
		        end
		end
	end
end
