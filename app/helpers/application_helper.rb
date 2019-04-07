module ApplicationHelper
  def session_link
if (logged_in?)
link_to "LOGOUT", logout_path, method: :delete
  else
   link_to "LOGIN", login_path
  end
end
end
