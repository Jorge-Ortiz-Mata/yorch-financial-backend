module Api
  module V1
    class ArticlesController < ApplicationController
      def dummy_articles
        render json: { response: 'Accepting Connections' }, status: :ok
      end
    end
  end
end
