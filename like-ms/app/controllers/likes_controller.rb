class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user

  def create
    post_id = params[:post_id]
    token = request.headers['Authorization']
    user_id = AuthenticationService.decode(token)

    return head :unauthorized unless user_id

    
    like = Reaction.new(post_id: post_id, user_id: user_id, liked_at: Time.now)

    if like.save
      render json: { message: 'Like registrado exitosamente' }, status: :created
    else
      render json: { error: 'No se pudo registrar el like' }, status: :unprocessable_entity
    end
  end

  private

  def authenticate_user
    token = request.headers['Authorization']
    if token.blank? || AuthenticationService.decode(token).nil?
      head :unauthorized
    end
  end
end