module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_user_jwt!

      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

      private

      def not_found
        render json: { error: "Not Found" }, status: :not_found
      end

      def unprocessable_entity(exception)
        render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

      def authenticate_user_jwt!
        unless current_user
          render json: { error: "Unauthorized" }, status: :unauthorized
        end
      end

      def current_user
        return @current_user if defined?(@current_user)

        # Extraer JWT del header Authorization
        token = request.headers["Authorization"]&.split(" ")&.last
        return nil unless token

        begin
          decoded = Warden::JWTAuth::TokenDecoder.new.call(token)
          @current_user = User.find(decoded["sub"])
        rescue StandardError
          nil
        end
      end
    end
  end
end
