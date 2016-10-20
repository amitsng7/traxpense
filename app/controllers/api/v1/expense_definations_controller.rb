module Api
	module V1
		class ExpenseDefinationsController < ApplicationController
			respond_to :json

			def show
				respond_with ExpenseDefination.find(params[:id])
			end
			def index
				respond_with ExpenseDefination.all()
			end
			def create
	        	@expense_defination = ExpenseDefination.new(expense_defination_params)
		        if	@expense_defination.save
		        	render json: @expense_defination, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @expense_defination.errors, errors: @expense_defination.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@expense_defination = ExpenseDefination.find(params[:id])
	          if @expense_defination.update(expense_defination_params)
	            render json: @expense_defination, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @expense_defination.errors, errors: @expense_defination.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def expense_defination_params
		        	params.require(:expense_defination).permit(:policy_id, :violation, :def_reimburse, :def_billable,
		        		:rate_per_mile, :rate_per_km, :def_unit, :def_dist_cat, :hourly_wage, :max_exp_age, :max_exp_amt,
		        		:receipt_req)
		        end
		end
	end
end
