class ApplicationController < ActionController::Base

  protected

    def is_authenticated?
      authenticate_or_request_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end

end
