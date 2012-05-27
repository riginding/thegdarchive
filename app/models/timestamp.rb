class Timestamp < ActiveRecord::Base
  belongs_to :vod

  validates :timeat, presence: true, uniqueness: { scope: :vod_id }
  validates :content, presence: true, uniqueness: { scope: :vod_id } 
end
