class Search < ActiveRecord::Base
  def vods
    @vods ||= find_vods
  end

private
  def find_vods
    vods = Vod.order(:id)
    vods = vods.where(accessible: true)
    vods = vods.where(game_id: game_id) if game_id.present?
    vods = vods.where(show_id: show_id) if show_id.present?
    vods = vods.where("upper(title) like ?", "%#{keywords.upcase}%") if keywords.present?
    vods
  end
end
