class ExercisesController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :load_place
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]

  def index
    @exercises = @place.exercises
    respond_with(@exercises)
  end

  def show
    respond_with(@exercise)
  end

  def new
    @exercise = Exercise.new
    respond_with(@exercise)
  end

  def edit
  end

  def create
    @exercise = @place.exercises.build(exercise_params)
    @exercise.save
    respond_with([@place,@exercise])
  end

  def update
    @exercise.update(exercise_params)
    respond_with([@place,@exercise])
  end

  def destroy
    @exercise.destroy
    respond_with([@place,@exercise])
  end

  private

    def load_place
      @place = current_user.places.find(params[:place_id])
    end

    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    def exercise_params
      params.require(:exercise).permit(:name, :values_type, :place_id)
    end
end
