class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :reviews
end
