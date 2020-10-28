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
  
    private def user_params
        params.require(:user).permit(:username, :password)
    end
end