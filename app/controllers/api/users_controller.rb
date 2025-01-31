module Api
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token  # Skip CSRF protection for API calls
  
      def create
        @user = User.new(user_params)
  
        if @user.save
          render json: { success: true, user: @user }, status: :created
        else
          render json: { success: false, errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      private
  
      def user_params
        params.require(:user).permit(:name, :email)
      end
    end
  end
  