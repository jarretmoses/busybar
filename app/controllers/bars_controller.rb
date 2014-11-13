class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    array = @foursquare.venue_photos(@bar.venue_id)[:items] if @bar.venue_id
    if array
      @photos = array.map do |photo|
          pre = photo[:prefix]
          post = photo[:suffix]
          pre + 'width200' + post
      end
    end
    @id = params[:id];
  end
end
