class FavouritesController < ApplicationController
  before_action :favourite_list, only: [:destroy]

  def new
    @favourite = Favourite.new
    @shoe = Shoe.find(params[:shoe_id])
  end

  def create
    # raise
    @favourite = Favourite.new(favourite_params)
    if @favourite.save
      redirect_to favourites_path
    end
  end

  def destroy
    @favourite.destroy
    redirect_to favourites_path, status: :see_other
  end

  private

  def favourite_list
    @favourite = Favourite.find(params[:id])
  end

  def favourite_params
    params.require(:favourite).permit(:user_id, :shoe_id)
  end
end
