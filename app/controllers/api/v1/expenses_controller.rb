module Api
  module V1
    class ExpensesController < AuthenticatedController
      before_action :authenticate_user
      before_action :set_expense, only: %i[destroy]

      def user_expenses; end

      def create
        debugger
      end

      def destroy
        @expense.destroy
      end

      private

      def expense_params
        params.require(:expense).permit(:title, :description, :quantity)
      end

      def set_expense
        @expense = Expense.find(params[:id])
      end
    end
  end
end
