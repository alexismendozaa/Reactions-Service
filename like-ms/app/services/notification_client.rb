require 'net/http'
require 'uri'
require 'json'

class NotificationClient
  NOTIFICATION_SERVICE_URL = 'http://52.71.105.21:8082/api/notify'

  def self.notify_like(post_owner_id, liker_user_id)
    uri = URI.parse(NOTIFICATION_SERVICE_URL)
    header = {'Content-Type': 'application/json'}
    body = {
      userId: post_owner_id.to_s,
      message: "Tu post recibió un like del usuario #{liker_user_id}"
    }.to_json

    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = body

    response = http.request(request)
    unless response.is_a?(Net::HTTPSuccess)
      Rails.logger.error("Error notificando like: #{response.code} #{response.message}")
    end
  rescue => e
    Rails.logger.error("Excepción notificando like: #{e.message}")
  end
end
