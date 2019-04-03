class LoginsController < ApplicationController
  def new
  end
  def create
    customer = Customer.find_by(email: params[:logins][:email])
    session[:customer_customerNumber] = customer.customerNumber
    if customer && customer.authenticate(params[:logins][:password])
      flash.notice = "You are now logged in."
      redirect_to customer
    else
      render 'new'
      flash.notice = "Bad login"
    end
  end
  def destroy
    session[:customer_customerNumber]=nil
    flash.notice = "You have logged out"
    redirect_to root_path
    end
end
