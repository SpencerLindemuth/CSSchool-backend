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

    def save
        @lesson = Lesson.find_by(lesson_number: params[:lesson])
        if @lesson.lesson_number > 1000
            render json: {message: "Out of track"}, status: :forbidden
        else
            @user = User.find_by(username: params[:username])
            @user.lessons << @lesson
            render json: {message: "saved"}, status: :accepted
        end
    end

    def continue
        @user = current_user
        @track = @user.lessons.sort_by{|lesson| lesson.lesson_number}
        if @track.length > 0
            @progress = @track.last
            render json: {progress: @progress}, status: :ok
        else
            render json: {progress: null}, status: :rejected
        end
    end


end
