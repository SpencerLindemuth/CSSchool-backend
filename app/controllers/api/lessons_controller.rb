class Api::LessonsController < ApplicationController
    skip_before_action :authorized
    def index
        @lessons = Lesson.all
        render json: @lessons
    end
end