module Api
  module V1
    class RevenuesController < AuthenticatedController
      before_action :authenticate_user

      def user_revenues; end

      def create
        @revenue = @user.revenues.new revenue_params

        if @revenue.save
          render json: { revenue: @revenue }, status: :ok
        else
          render json: { errors: @revenue.errors }, status: :unprocessable_entity
        end
      end

      def update
        debugger

      end

      def destroy
        debugger

      end

      private

      def revenue_params
        params.require(:revenue).permit(:title, :description, :quantity)
      end
    end
  end
end
