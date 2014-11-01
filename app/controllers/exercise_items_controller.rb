class ExerciseItemsController < ApplicationController
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
    @exercise_item = ExerciseItem.new(exercise_item_params)
    @exercise_item.save
    respond_with(@exercise_item)
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
    def set_exercise_item
      @exercise_item = ExerciseItem.find(params[:id])
    end

    def exercise_item_params
      params.require(:exercise_item).permit(:workout_id, :exercise_id, :time, :repeats_count, :value)
    end
end
