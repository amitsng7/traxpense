module Api
	module V1
		class ReportDefinationsController < ApplicationController
			respond_to :json

			def show
				respond_with ReportDefination.find(params[:id])
			end
			def index
				respond_with ReportDefination.all()
			end
			def create
	        	@report_defination = ReportDefination.new(report_defination_params)
		        if	@report_defination.save
		        	render json: @report_defination, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @report_defination.errors, errors: @report_defination.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@report_defination = ReportDefination.find(params[:id])
	          if @report_defination.update(report_defination_params)
	            render json: @report_defination, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @report_defination.errors, errors: @report_defination.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def report_defination_params
		        	params.require(:report_defination).permit(:policy_id, :currency, :frequency, :report_header)
		        end
		end
	end
end
