class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by(id: params[:id])
    @posts = Post.where(place_id: @place.id)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      redirect_to places_path, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
