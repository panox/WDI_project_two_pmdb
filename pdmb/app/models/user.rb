class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  validates_uniqueness_of :email
  has_many :reviews, dependent: :destroy

  def name=(s)
    write_attribute(:username, s.to_s.titleize)
  end

end
