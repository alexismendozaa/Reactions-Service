class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user

  def create
    post_id = params[:post_id]
    token = request.headers['Authorization']
    user_id = AuthenticationService.decode(token)

    return head :unauthorized unless user_id

    # Buscar el 'like' existente
    like = Reaction.find_by(post_id: post_id, user_id: user_id)

    if like
      # Si el like existe, eliminarlo (dislike)
      like.destroy
      render json: { message: 'Like eliminado exitosamente' }, status: :ok
    else
      # Si no se encuentra el like, responder con error
      render json: { error: 'No se pudo encontrar el like' }, status: :not_found
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
