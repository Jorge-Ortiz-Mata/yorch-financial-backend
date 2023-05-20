module Api
  module V1
    class ArticlesController < ApplicationController
      def dummy_articles
        render json: { environment: ENV['RAILS_ENV'] }, status: :ok
      end
    end
  end
end
