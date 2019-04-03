class ApplicationController < ActionController::Base
  protect_from_forgery:null_session, prepend: true
helper_method :current_user, :logged_in?, :current_order
def current_user
  @current_user ||= Customer.find(session[:customer_customerNumber]) if session[:customer_customerNumber]
end
  def logged_in?
    !!current_user
end

def current_order
   if session[:order_id]
     Order.find(session[:order_id])
   else
     Order.new
   end
 end
end
