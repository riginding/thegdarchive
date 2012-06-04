module ApplicationHelper
  def latest_vods
    Vod.where(accessible: true).last(3).reverse
  end
end
