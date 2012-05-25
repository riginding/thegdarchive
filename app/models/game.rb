class Game < ActiveRecord::Base
  has_many :vods
  validates :name, uniqueness: true
end
