module Api
	module V1
		class ExpensesController < ApplicationController
			respond_to :json

			def show
				respond_with Expense.find(params[:id])
			end
			def index
				respond_with Expense.all()
			end
			def create
	        	@expense = Expense.new(expense_params)
		        if	@expense.save
		        	render json: @expense, status: :ok
		        else
		        	render json: { success: false, info: "Couldn't save ", data: @expense.errors, errors: @expense.errors.full_messages.to_sentence },
                   status: :unprocessable_entity
		        end
	        end
	        def update
	        	@expense = Expense.find(params[:id])
	          if @expense.update(expense_params)
	            render json: @expense, status: :ok
	          else
	            render json: { success: false, info: "Couldn't update ", data: @expense.errors, errors: @expense.errors.full_messages.to_sentence },
	                   status: :unprocessable_entity
	          end
	        end
	        private
		        def expense_params
		        	params.require(:expense).permit(:user_id, :report_id, :remiburse, :billable, :date, :merchant, :amount,
		        	                                :category, :comment)
		        end
		end
	end
end
