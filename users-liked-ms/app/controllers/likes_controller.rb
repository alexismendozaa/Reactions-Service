class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]
  before_action :authenticate_user

  def show
    post_id = params[:post_id]
    token = request.headers['Authorization']
    user_id = AuthenticationService.decode(token)

    return head :unauthorized unless user_id

    # Contamos los likes para el post específico
    reactions = Reaction.where(post_id: post_id)

    # Obtenemos los usuarios que han dado like
    users = reactions.map do |reaction|
      user = User.find_by(id: reaction.user_id)  # Buscar al usuario en la base de datos de 'users'
      {
        username: user.username,
        email: user.email
      } if user
    end.compact

    render json: { users: users }, status: :ok
  end

  private

  def authenticate_user
    token = request.headers['Authorization']
    if token.blank? || AuthenticationService.decode(token).nil?
      head :unauthorized
    end
  end
end
