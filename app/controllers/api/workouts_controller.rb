class Api::WorkoutsController < ApiController
  def index
    @place = current_user.places.find_by(id: params[:place_id])
    @workouts = (@place || current_user).workouts.sorted.load
  end

  def create
    @place = current_user.places.find(params[:place_id])
    @workout = current_user.workouts.create

    respond_with(@workout, location: nil)
  end
end
