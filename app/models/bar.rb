class Bar < ActiveRecord::Base

  def self.create_from_array(array)
    array.collect do |bar|
      create(bar)
    end
  end
end
