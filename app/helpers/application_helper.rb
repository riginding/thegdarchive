module ApplicationHelper
  def latest_vods
    Vod.last(5).reverse
  end
end
