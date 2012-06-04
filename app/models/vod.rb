class Vod < ActiveRecord::Base
  has_many :timestamps, dependent: :destroy
  belongs_to :game
  belongs_to :show

  is_impressionable counter_cache: {column_name: :views}

  default_scope where(accessible: true)
  scope :most_watched, lambda { where("views is not null").order("views DESC").first(3) }
  #validates :clip_id, uniqueness: true
end
