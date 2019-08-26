class Api::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.where('username ilike ?', params[:username])[0]
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id, username: @user.username})
            render json: {user: {user_id: @user.id, username: @user.username}, jwt: token}, status: :accepted
        else
            render json: {message: 'Invalid username or password'}, status: :unauthorized
        end
    end
end
