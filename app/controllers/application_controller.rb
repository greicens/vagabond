class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include UsersHelper
  include SessionsHelper
  include CitiesHelper
  private
    def require_login
      if !current_user
        redirect_to login_path
      end
    end
end
