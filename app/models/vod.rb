class Vod < ActiveRecord::Base
  has_many :timestamps
  belongs_to :game
  belongs_to :show

 # validates :clip_id, uniqueness: true
end
