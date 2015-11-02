class Director < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :movies
end
