class LoginsController < ApplicationController
  def new
  end
  def create
    customer = Customer.find_by(email: params[:logins][:email])

    if customer && customer.authenticate(params[:logins][:password])
      session[:customer_customerNumber] = customer.customerNumber
      flash.notice = "You are now logged in."

      redirect_to customer
    else
      flash.notice = "Invalid login.  Try Again or Sign Up.  "
    redirect_to '/login'
    end
  end
  def destroy
    session[:customer_customerNumber]=nil
    flash.notice = "You have logged out"
    redirect_to root_path
    end
end
