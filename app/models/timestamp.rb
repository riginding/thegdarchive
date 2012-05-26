class Timestamp < ActiveRecord::Base
  belongs_to :vod

  validates :timeat, presence: true
  validates :content, presence: true
end
