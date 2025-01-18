class Api::V1::UsersController < ApplicationController
    def index
        users = User.all
        render json: users, status: :ok
    end

    def create
        puts user_params
        user = User.new(user_params)
        if user.save
            render json: user, status: :created 
        else
            render json: {error: 'Error creating user'}, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end
