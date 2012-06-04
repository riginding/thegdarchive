class Vod < ActiveRecord::Base
  has_many :timestamps
  belongs_to :game
  belongs_to :show

  default_scope where(accessible: true)
  #validates :clip_id, uniqueness: true
end
