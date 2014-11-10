class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    # @photos = @foursquare.venue_photos(@bar.)
  end
end
