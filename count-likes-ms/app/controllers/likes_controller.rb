class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]  # Cambiamos a 'show' en vez de 'create'
  before_action :authenticate_user

  def show 
    post_id = params[:post_id]  
    token = request.headers['Authorization']
    user_id = AuthenticationService.decode(token)

    return head :unauthorized unless user_id

   
    likes_count = Reaction.where(post_id: post_id).count

    
    render json: { likes_count: likes_count }, status: :ok
  end

  private

  def authenticate_user
    token = request.headers['Authorization']
    if token.blank? || AuthenticationService.decode(token).nil?
      head :unauthorized
    end
  end
end
