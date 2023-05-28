module Api
  module V1
    class ProfilesController < AuthenticatedController
      before_action :authenticate_user
      before_action :set_profile, only: %i[show update upload_avatar]

      def show; end

      def create
        @profile = @user.build_profile profile_params

        if @profile.save
          render json: { profile: @profile }, status: :ok
        else
          render json: { errors: @profile.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @profile.update(profile_params)
          render json: { profile: @profile }, status: :ok
        else
          render json: { errors: [@profile.errors] }, status: :unprocessable_entity
        end
      end

      def upload_avatar
        if @profile.avatar.attach(params[:avatar])
          render json: { avatar: url_for(@profile.avatar) }, status: :ok
        else
          render json: { errors: 'Something occurred' }, status: :unprocessable_entity
        end
      end

      private

      def set_profile
        @profile = @user.profile
      end

      def profile_params
        params.require(:profile).permit(
          :name, :paternal_name, :maternal_name, :sex, :date_of_birth, :job_title, :summary
        )
      end
    end
  end
end
