class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @categories = ["chinese", "italian", "japanese", "french", "belgian"]
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(user_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Your Restaurant has been created!"
    else
      render :new
    end


  end

  private

  def user_params
     params.require(:restaurant).permit(:name, :address, :category)
  end

end
