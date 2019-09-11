class Api::LessonsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]
    def index
        @lessons = Lesson.all
        render json: @lessons
    end

    def create
        existing_lessons = Lesson.all.map{|lesson| lesson.lesson_number}
        random_number = rand(1000..999999)
        until !existing_lessons.include?(random_number)
            random_number = rand(1000..999999)
        end
        @lesson = Lesson.new(template: params[:template], lesson: params[:lesson], title: params[:title], difficulty: params[:difficulty], html: params[:html], css: params[:css], button_one_text: params[:button_one_text], button_two_text: params[:button_two_text], button_three_text: params[:button_three_text], button_four_text: params[:button_four_text], button_one_action_css: params[:button_one_action_css], button_two_action_css: params[:button_two_action_css], button_three_action_css: params[:button_three_action_css], button_four_action_css: params[:button_four_action_css], lesson_number: random_number)
        if @lesson.save
            render json: @lesson
        else
            render json: {error: 'failed to create lesson'}, status: :not_acceptable
        end
    end
end