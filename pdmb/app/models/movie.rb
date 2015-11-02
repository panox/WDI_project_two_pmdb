class Movie < ActiveRecord::Base
  belongs_to :director
  has_many :reviews
  validates_uniqueness_of :name
  #Pg Search
  include PgSearch
  pg_search_scope :search_by_title, :against => :name

  def rating
    total = reviews.reduce(0) do |sum, review|
      sum + review.rating
    end
    total > 0 ? total / reviews.length : 0
  end
end
