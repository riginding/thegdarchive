class Timestamp < ActiveRecord::Base
  belongs_to :vod

  validates :timeat, presence: true
end
