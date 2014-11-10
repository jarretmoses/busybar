class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :create_client

  private
    def create_client
      @foursquare = Foursquare2::Client.new(
        :client_id => 'I4MUTLKEN1MJOIUVCVAJWNVHORGNWL2O0MNXXTULHQ02PF4V', 
        :client_secret => 'YGE3QOZCGXUAPH5YGVPYBMG45IAYGNKXGYZFGABFMAECB0ML',
        :api_version => '20140806'
      )
    end
end
