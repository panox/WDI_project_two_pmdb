class Director < ActiveRecord::Base
  has_many :movies
  has_many :reviews
end
