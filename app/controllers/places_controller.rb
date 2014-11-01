class PlacesController < ApplicationController
  respond_to :html
  before_action :authenticate_user!
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = current_user.places
    respond_with(@places)
  end

  def show
    respond_with(@place)
  end

  def new
    @place = current_user.places.build
    respond_with(@place)
  end

  def edit
  end

  def create
    @place = current_user.places.build(place_params)
    @place.save
    respond_with(@place)
  end

  def update
    @place.update(place_params)
    respond_with(@place)
  end

  def destroy
    @place.destroy
    respond_with(@place)
  end

  private

  def set_place
    @place = current_user.places.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :description)
  end
end
