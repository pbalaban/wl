class ExerciseItemsController < ApplicationController
  before_action :load_place_and_workout
  before_action :set_exercise_item, only: [:show, :edit, :update, :destroy]

  def index
    @exercise_items = ExerciseItem.all
    respond_with(@exercise_items)
  end

  def show
    respond_with(@exercise_item)
  end

  def new
    @exercise_item = ExerciseItem.new
    respond_with(@exercise_item)
  end

  def edit
  end

  def create
    @exercise_item = @workout.exercise_items.build(exercise_item_params)
    if @exercise_item.save
      redirect_to [@place, @workout]
    else
      render :new
    end
  end

  def update
    @exercise_item.update(exercise_item_params)
    respond_with(@exercise_item)
  end

  def destroy
    @exercise_item.destroy
    respond_with(@exercise_item)
  end

  private

    def load_place_and_workout
      @place = current_user.places.find(params[:place_id])
      @workout = @place.workouts.find(params[:workout_id])
    end

    def set_exercise_item
      @exercise_item = ExerciseItem.find(params[:id])
    end

    def exercise_item_params
      params.require(:exercise_item).permit(:workout_id, :exercise_id, :time, :repeats_count, :weight)
    end
end
