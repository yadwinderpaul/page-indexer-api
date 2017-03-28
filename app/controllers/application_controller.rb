class ApplicationController < ActionController::Base

  protected

    def is_authenticated?
      authenticate_or_request_with_http_basic do |username, password|
        User.authenticate(username, password)
      end
    end

    def render_api(object:, serializer: nil)
      if(serializer)
        render json: object, root: 'data', adapter: :json, meta: { success: true }, serializer: serializer
      else
        render json: object, root: 'data', adapter: :json, meta: { success: true }
      end
    end

end
