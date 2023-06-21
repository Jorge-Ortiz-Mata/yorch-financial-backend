# frozen_string_literal: true

require 'jwt'

module Api
  class AuthenticatedController < ApplicationController
    private

    def authenticate_user
      @jwt_token = request.headers['HTTP_AUTHORIZATION']

      if @jwt_token.present?
        @decoded_token = Yorchauthapi.decode_jwt(@jwt_token)
        authentication_token = AuthenticationToken.find_by(auth_token: @decoded_token['auth_token'])
        @user = User.find_by(email: @decoded_token['email'])

        render json: { errors: ['JWT expiró'] }, status: :unauthorized unless authentication_token.present?
      else
        render json: { errors: ['JWT no fue añadido'] }, status: :unauthorized
      end
    end

    def user_permissions
      jwt_token = request.headers['HTTP_AUTHORIZATION']
      decoded_token = Yorchauthapi.decode_jwt(jwt_token)
      authentication_token = AuthenticationToken.find_by(auth_token: decoded_token['auth_token'])

      return if authentication_token.user_id == params[:id].to_i

      render json: { errors: ['Este usuario no tiene permisos para editar este registro'] }, status: :unauthorized
    end
  end
end
