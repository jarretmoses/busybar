class BarsearchesController < ApplicationController 
  def index
  end

  def results
    @results = all(@foursquare)
    @bars = Bar.create_from_array(@results)
  end

  private

    def find_bars(client)
      client.search_venues(:near => "Lower East Side",radius: 3000, :intent => 'browse', :query=> 'pub', :categoryID => '4bf58dd8d48988d11b941735')['venues']
    end
  
    def format_bars(bars)
      bars.collect do |bar|
        {venue_id: bar[:id], name: bar[:name], address: bar[:location][:address], checkinsCount: bar[:stats]['checkinsCount'], usersCount: bar[:stats]['usersCount'], cat_id: bar[:categories][0].to_h['id'], url: bar[:url], here_now: bar[:hereNow][:count]}
      end
    end

    def parse_bars(bars)
      bars.select { |bar| bar[:cat_id] == '4bf58dd8d48988d11b941735' }
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
