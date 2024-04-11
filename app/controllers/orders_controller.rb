class OrdersController < ApplicationController
  before_action :order_list, only: [:show, :edit, :update]
  def index
    @orders = Order.all
    @shoe = Shoe.find(params[:shoe_id])
  end

  def show
    # raise
    @shoe = Shoe.find(params[:shoe_id])
  end

  def new
    @order = Order.new
    @shoe = Shoe.find(params[:shoe_id])
  end

  def create
    # raise
    @order = Order.new(order_params)
    @shoe = Shoe.find(params[:shoe_id])

    if @order.save
      redirect_to shoe_path(@shoe)
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    @shoe = Shoe.find(@order.shoe_id)
  end

  def update
    @order.update(order_params)
    redirect_to user_orders_path(current_user)
  end

  private

  def order_params
    params.require(:order).permit(:from, :to, :user_id, :shoe_id)
  end

  def order_list
    @order = Order.find(params[:id])
  end
end
