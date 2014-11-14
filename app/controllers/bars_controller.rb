class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @id = params[:id];
    array = @foursquare.venue_photos(@bar.venue_id)[:items] if @bar.venue_id
    @photos = Bar.get_photos(array) if array
  end
end
