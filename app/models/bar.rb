class Bar < ActiveRecord::Base
  validates_uniqueness_of :name

  def self.create_from_array(array)
    array.collect do |bar|
      find_or_create(bar)
    end
  end

  private
    def self.find_or_create(bar)
      Bar.find_by(name: bar[:name]) || create(bar)
    end
end
