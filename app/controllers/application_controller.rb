class ApplicationController < ActionController::Base
    helper :all # include all helpers, all the time
    protect_from_forgery
    before_filter :authenticate, :except => [:index, :show]
    private

    def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == "admin" && password == "teilnehmer"
      end
    end
end
