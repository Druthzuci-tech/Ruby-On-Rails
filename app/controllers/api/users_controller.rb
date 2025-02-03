module Api
    class UsersController < ApplicationController
      skip_before_action :verify_authenticity_token  
  
      def create
        @user = User.new(user_params)
  
        if @user.save
          
          render json: { status: 201, message: 'User created successfully!', user: @user }, status: :created
        else
        
          render json: { status: 422, message: 'Error creating user', errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
  
      private
  
      def user_params
        params.require(:user).permit(:name, :email)
      end
    end
  end
  