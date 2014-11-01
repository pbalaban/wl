class WorkoutsController < ApplicationController
  respond_to :html
  before_action :load_place
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = @place.workouts.sorted
    respond_with(@workouts)
  end

  def show
    @items = @workout.exercise_items
    @exercise_item = ExerciseItem.new
    respond_with(@workout)
  end


  def create
    @workout = @place.workouts.create
    respond_with([@place, @workout])
  end

  def destroy
    @workout.destroy
    respond_with(@workout)
  end

  private

    def load_place
      @place = current_user.places.find(params[:place_id])
    end

    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:date)
    end
end
