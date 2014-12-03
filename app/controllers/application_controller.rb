class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :create_client

  private
    def create_client
      @foursquare = Foursquare2::Client.new(
        :client_id => ENV["FOURSQUARE_CLIENT_ID"], 
        :client_secret => ENV["FOURSQUARE_CLIENT_SECRET"],
        :api_version => ENV["FOURSQUARE_API_VERSION"],
      )
    end
end
