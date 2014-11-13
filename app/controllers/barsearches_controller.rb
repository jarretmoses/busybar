class BarsearchesController < ApplicationController 
  def index

  end

  def results
    if params['Category']['bar'] != "" && params['Location']['near']!= ""
      @location = Location.find_by(near: params['Location']['near'])
      @category = Category.find_by(name: params['Category']['bar'])
      @results = all(@foursquare)
      @bars = Bar.create_from_array(@results)
    else
      flash.now[:notice] = "Please select a bar type and location"
      render :index
    end
  end

  private

    def find_bars(client)
      client.search_venues(:near => @location.near + ", New York, NY",radius: 2500, :intent => 'browse', :query=> @category.name, :categoryID => @category.cat_id)['venues']
    end
  
    def format_bars(bars)
      bars.collect do |bar|
        {venue_id: bar[:id], name: bar[:name], address: bar[:location][:address], checkinsCount: bar[:stats]['checkinsCount'], usersCount: bar[:stats]['usersCount'], cat_id: bar[:categories][0].to_h['id'], url: bar[:url], here_now: bar[:hereNow][:count]}
      end
    end

    def parse_bars(bars)
      bars.select { |bar| bar[:cat_id] == @category.cat_id }
    end

    def sort_bars(bars)
      bars.sort {|bar1,bar2| bar2[:checkinsCount] <=> bar1[:checkinsCount]}
    end

    def all(client)
      find = find_bars(client)
      format = format_bars(find)
      parse = parse_bars(format)
      sort = sort_bars(parse)
    end

    helper_method :create_client
end
