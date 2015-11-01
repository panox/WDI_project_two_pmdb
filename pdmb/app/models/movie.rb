class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :reviews
  ratyrate_rateable "overall"
end
