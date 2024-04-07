class ReviewsController < ApplicationController

  def new
    # raise
    # @shoe = Shoe.find(params[:shoe_id])
    @order = Order.find(params[:order_id])
    @review = Review.new
  end

  def create
    # raise
    @order = Order.find(params[:order_id])
    @shoe = Shoe.where(id: @order.shoe_id)
    @review = Review.new(review_params)
    if @review.save
      redirect_to shoe_path(@shoe.first)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :order_id, :shoe_id)
  end
end
