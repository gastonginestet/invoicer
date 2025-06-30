# app/controllers/api/v1/registrations_controller.rb
module Api
  module V1
    class RegistrationsController < BaseController
      include Devise::Controllers::Helpers

      skip_before_action :authenticate_user!, only: [ :create ]
      respond_to :json

      def create
        user = User.new(sign_up_params)
        if user.save
          sign_in(user)
          render json: { message: "Signed up successfully" }, status: :created
        else
          render json: { error: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
