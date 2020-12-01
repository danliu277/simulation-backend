class UsersController < ApplicationController
    def create
        user = User.new(
            username: params[:username],
            password: params[:password],
        )
        if user.save
            token = encode_token(user.id)
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def login
        user = User.find_by(username: params[:username])
        byebug
        render json: {user: user, token: token}
    end
  
    private def user_params
        params.require(:user).permit(:username, :password)
    end
end