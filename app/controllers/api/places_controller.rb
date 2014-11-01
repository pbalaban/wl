class Api::PlacesController < ApiController
  def index
    @places = current_user.places
  end

  def create
    @place = current_user.places.new(place_params)

    if @place.save
      respond_with(@place, location: nil)
    else
      respond_with(@place, status: 422)
    end
  end

  private
    def place_params
      params.require(:place).permit(*%i[name description])
    end
end
