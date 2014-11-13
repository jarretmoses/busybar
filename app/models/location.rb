class Location < ActiveRecord::Base
  validates_uniqueness_of :near
end
