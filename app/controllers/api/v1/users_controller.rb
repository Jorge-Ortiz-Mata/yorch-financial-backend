require 'jwt'

module Api
  module V1
    class UsersController < AuthenticatedController
      before_action :authenticate_user, except: %i[create]
      before_action :user_permissions, only: %i[show update destroy]
      before_action :set_user, except: %i[create]

      def show; end

      def create
        @user = User.new user_params

        if @user.save
          AuthenticationToken.create(user_id: @user.id)

          token_encoded = Yorchauthapi.encode_jwt(@user)
          render json: { auth_token: token_encoded }, status: :ok
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @user.update user_params
          render json: { id: @user.id, email: @user.email }, status: :ok
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        render json: { response: ['Email has been deleted succesfully'] }, status: :ok
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
