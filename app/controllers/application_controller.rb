class ApplicationController < ActionController::Base
  protect_from_forgery

  def gdstudio_online?
    url = "http://api.justin.tv/api/stream/list.json?channel=gdstudio"
  end
end
