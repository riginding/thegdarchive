class Vod < ActiveRecord::Base
  has_many :timestamps
  belongs_to :game
  belongs_to :show
end
