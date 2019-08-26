class Api::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]


    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: {user_id: @user.id, username: @user.username}, jwt: @token}, status: :created
        else
            render json: {error: 'failed to create user'}, status: :not_acceptable
        end
    end


end
