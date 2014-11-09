class BarsearchesController < ApplicationController 
  before_action :create_client, only: [:index, :results]


  def index
  end

  def results
    results = all(@foursquare)
    binding.pry
  end

  private
    def create_client
     @foursquare = Foursquare2::Client.new(
      :client_id => 'I4MUTLKEN1MJOIUVCVAJWNVHORGNWL2O0MNXXTULHQ02PF4V', 
      :client_secret => 'YGE3QOZCGXUAPH5YGVPYBMG45IAYGNKXGYZFGABFMAECB0ML',
      :api_version => '20140806'
     )
    end

    def all(client)
      find = find_bars(client)
      format = format_bars(find)
      parse = parse_bars(format)
      sort = sort_bars(parse)
    end

    def find_bars(client)
      client.search_venues(:near => "Lower East Side",radius: 3000, :intent => 'browse', :query=> 'pub', :categoryID => '4bf58dd8d48988d11b941735')['venues']
    end

    def format_bars(bars)
      bars.collect do |bar|
        {name: bar[:name], address: bar[:location][:address], stats: bar[:stats], id: bar[:categories][0].to_h}
      end
    end

    def parse_bars(bars)
      bars.select { |bar| bar[:id]['id'] == '4bf58dd8d48988d11b941735' }
    end

    def sort_bars(bars)
      bars.sort {|bar1,bar2| bar2[:stats]['checkinsCount'] <=> bar1[:stats]['checkinsCount']}
    end


end
