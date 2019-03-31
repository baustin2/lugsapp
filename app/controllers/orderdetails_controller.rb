class OrderdetailsController < ApplicationController

  def destroy
  @order = current_order
  @detail = @order.orderdetails.find(params[:id])
  @detail.destroy
  @order.save
  redirect_to cart_path
end

  def create
    @order = current_order
    @detail = @order.orderdetails.new(detail_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  private

  def detail_params
    params.require(:orderdetail).permit(:id,:productName,:quantityOrdered, :productCode, :priceEach)
  end
end
