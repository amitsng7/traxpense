module Api
	module V1
		class CustomTagsController < ApplicationController
			respond_to :json

			def show
				respond_with CustomTag.find(params[:id])
			end
			def index
				respond_with CustomTag.all()
			end
			def create
	        	@custom_tag = CustomTag.new(custom_tag_params)
		        if	@custom_tag.save
		        	render json: @custom_tag, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @custom_tag.errors, errors: @custom_tag.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@custom_tag = CustomTag.find(params[:id])
	          if @custom_tag.update(custom_tag_params)
	            render json: @custom_tag, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @custom_tag.errors, errors: @custom_tag.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def custom_tag_params
		        	params.require(:custom_tag).permit(:policy_id, :name, :gl_code, :tag_required)
		        end
		end
	end
end
