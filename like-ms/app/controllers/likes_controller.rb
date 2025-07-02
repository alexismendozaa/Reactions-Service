class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user

  require 'net/http'
  require 'uri'
  require 'json'

  # POST /likes
  def create
    @like = Reaction.new(like_params)
    if @like.save
      begin
        notify_like_to_java(@like.user_id, @like.post_id)
      rescue => e
        Rails.logger.error("Error notificando like a Java: #{e.message}")
      end
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  def notify_like_to_java(user_id, post_id)
    uri = URI.parse("http://52.71.105.21:8082/api/notifications/like")
    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    req.body = {
      userId: user_id,
      postId: post_id,
      createdAt: Time.now.utc.iso8601
    }.to_json
    http.request(req)
  end

  # Strong parameters
  def like_params
    params.require(:reaction).permit(:user_id, :post_id, :reaction_type)
  end
end
