class Timestamp < ActiveRecord::Base
  belongs_to :vod

  validates :timeat, presence: true, uniqueness: true
  validates :content, presence: true, uniqueness: true
end
