class LoginsController < ApplicationController
  def new
  end
  def create
    customer = Customer.find_by_email(params[:email])
  # If the user exists AND the password entered is correct.
  if customer && customer.authenticate(params[:password])
    # Save the user id inside the browser cookie. This is how we keep the user
    # logged in when they navigate around our website.
    session[:customer_customerNumber] = customer.customerNumber
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
