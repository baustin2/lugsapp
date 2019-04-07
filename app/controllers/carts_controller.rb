class CartsController < ApplicationController

  def show
    @orderdetails = current_order.orderdetails
  end
end
