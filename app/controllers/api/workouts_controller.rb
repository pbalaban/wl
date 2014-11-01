class Api::WorkoutsController < ApiController
  before_action :load_workout, only: %i[show destroy]

  def index
    @workouts = begin_search_chain.workouts.includes(:place).sorted.limit_with(params[:limit]).load
  end

  def show
  end

  def create
    @place = current_user.places.find(params[:place_id])
    @workout = @place.workouts.create
    respond_with(@workout, location: nil)
  end

  def destroy
    @workout.destroy
    render json: { success: @workout.destroyed? }
  end

  private
    def begin_search_chain
      params[:place_id] ? current_user.places.find(params[:place_id]) : current_user
    end

    def load_workout
      @workout = current_user.workouts.find(params[:id])
    end
end
