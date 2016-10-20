module Api
	module V1
		class ReportsController < ApplicationController
			respond_to :json

			def show
				respond_with Report.find(params[:id])
			end
			def index
				respond_with Report.all()
			end
			def create
	        	@report = Report.new(report_params)
		        if	@report.save
		        	render json: @report, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @report.errors, errors: @report.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@report = Report.find(params[:id])
	          if @report.update(report_params)
	            render json: @report, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @report.errors, errors: @report.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def report_params
		        	params.require(:report).permit(:user_id, :name, :from_date, :to_date, :status, :comment)
		        end
		end
	end
end
