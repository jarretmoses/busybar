class Bar < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.create_from_array(array)
    array.collect do |bar|
      find_or_create(bar)
    end
  end

  def self.get_ratings(bars,client)
      bars.each do |bar|
        bar.update_rating(client)
      end
  end

  def self.get_photos(photo_ids)
    photo_ids.map do |photo|
      pre = photo[:prefix]
      post = photo[:suffix]
      small = pre + 'width120' + post
      large = pre + 'width480' + post
      {small: small, large: large}
    end
  end

  def update_rating(client)
    rating = client.venue(self.venue_id)["rating"]
    if rating == nil
      self.rating = 0.0
      self.save
    elsif rating != self.rating
      self.rating = rating
      self.save
    else
    end
  end

  private
    def self.find_or_create(bar)
      Bar.find_by(name: bar[:name]) || create(bar)
    end
end
