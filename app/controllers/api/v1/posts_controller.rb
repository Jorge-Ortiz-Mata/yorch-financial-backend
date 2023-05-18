module Api
  module V1
    class PostsController < AuthenticatedController
      before_action :authenticate_user
      before_action :set_post, only: %i[ show update destroy ]

      def index
        @posts = Post.all

        render json: { posts: @posts }, status: :ok
      end
    end
  end
end
