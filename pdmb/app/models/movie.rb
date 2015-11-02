class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :reviews
  #Pg Search
  include PgSearch
  pg_search_scope :search_by_title, :against => :name
  #Ratings
  ratyrate_rateable "overall"
end
