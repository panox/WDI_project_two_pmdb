class Director < ActiveRecord::Base
  validates_uniqueness_of :name
  validates :name, :country, :picture, :description, presence: true
  has_many :movies

  mount_uploader :picture, PicUploader
end
