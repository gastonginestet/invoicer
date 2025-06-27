module Api
  module V1
    class Api::V1::SessionsController < ActionController::API
      def create
        user = User.find_for_database_authentication(email: params[:user][:email])

        if user&.valid_password?(params[:user][:password])
          token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first
          render json: { token: token, message: "Logged in" }, status: :ok
        else
          render json: { error: "Invalid credentials" }, status: :unauthorized
        end
      end

      def destroy
        render json: { message: "Logged out" }
      end
    end
  end
end
