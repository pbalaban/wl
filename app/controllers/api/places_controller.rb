class Api::PlacesController < ApiController
  before_action :load_place, only: %i[show destroy]

  def index
    @places = current_user.places.limit_with(params[:limit]).load
  end

  def show
  end

  def create
    @place = current_user.places.create(place_params)
    respond_with(@place, location: nil)
  end

  def destroy
    @place.destroy
    render json: { success: @place.destroyed? }
  end

  private
    def place_params
      params.require(:place).permit(*%i[name description])
    end

    def load_place
      @place = current_user.places.find(params[:id])
    end
end
