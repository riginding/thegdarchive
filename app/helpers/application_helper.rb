module ApplicationHelper
  def latest_vods
    Vod.where(accessible: true).last(5).reverse
  end
end
