class UsersController < ApplicationController
    def create
        user = User.new(
            username: params[:username],
            password: params[:password],
        )
        if user.save
            render json: user
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user
            if user.authenticate(params[:password])
                render json: user
            else
                render json: {errors: ["Username and password does not match"}]
            end
        else
            render json: {errors: user.errors.full_messages}
        end
    end
  
    private def user_params
        params.require(:user).permit(:username, :password)
    end
end