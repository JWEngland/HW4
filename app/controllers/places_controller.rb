class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @posts = @place.posts
  end

  def new
    @place = Place.new
  end
  
  def create
    puts "Creating place..."
    puts place_params.inspect
  
    @place = Place.new(place_params)
  
    if @place.save
      puts "Place saved successfully!"
      redirect_to @place, notice: 'Place was successfully created.'
    else
      puts "Failed to save place!"
      flash.now[:alert] = 'Failed to create place.'
      puts @place.errors.inspect
      render :new
    end
  end
  
  

  private

  def place_params
    params.require(:place).permit(:name, :description)
  end
end
