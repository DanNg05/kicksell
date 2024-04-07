class ShoesController < ApplicationController
  before_action :shoe_list, only: [:show, :edit, :update, :destroy]

  def index
    # raise
    @shoes = Shoe.all
  end

  def show
    # raise
    # @shoe = Shoe.find(params[:id])
    @user = User.where(id: @shoe.user_id)
    @orders = Order.where(shoe_id: @shoe.id, user_id: current_user.id)
    @favourite = Favourite.new
    # raise
  end

  def new
    # raise
    @shoe = Shoe.new
  end

  def create
    # raise
    # @shoe = current_user.shoes.build(shoes_params)
    @shoe = Shoe.new(shoe_params)
    @shoe.user = current_user
    if @shoe.save
      redirect_to shoe_path(@shoe)
    else
      render :new
    end
  end


  def edit

  end

  def update
    @shoe.update(shoe_params)
    redirect_to shoe_path(@shoe)
  end

  def destroy
    @shoe.destroy
    redirect_to shoes_path, status: :see_other
  end

  def my_orders
  end


  def favourites
    @favourites = Favourite.all
  end

  def casual
    @shoes = Shoe.where(category: "Casual")
  end

  def luxury
    @shoes = Shoe.where(category: "Luxury")
  end

  def formal
    @shoes = Shoe.where(category: "Formal")
  end

  private

  def shoe_params
    params.require(:shoe).permit(:name, :description, :price, :size, :category, photos: [])
  end

  def shoe_list
    @shoe = Shoe.find(params[:id])
  end
end
