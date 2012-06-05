require 'json'
require_relative '../../lib/twitch/jtv_client'
class Stream
  def self.online?
    jtv_client = JtvClient.new      
    response = jtv_client.get("/stream/list.json?channel=thegdstudio") 

    if response.is_a?(Net::HTTPOK)
      stream = JSON.parse(response.body)
    end

    !stream.empty?
  end
end
