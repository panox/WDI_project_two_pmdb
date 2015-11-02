class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :reviews
  #Pg Search
  include PgSearch
  pg_search_scope :search_by_title, :against => :name
  #Ratings
  ratyrate_rateable "overall"
  #Movie Rating Sorting 
  scope :with_ratings, ->{includes(:rate_average_without_dimension).order("rating_caches.avg desc")}
end
