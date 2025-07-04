class ReactionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user # aquí asumes que tienes un método que pone @current_user

  def create
    @reaction = Reaction.new(
      post_id: reaction_params[:post_id],
      user_id: @current_user.id # sacado del JWT
      # liked_at se pone solo o usa Time.current si es manual
    )
    if @reaction.save
      render json: @reaction, status: :created
    else
      render json: @reaction.errors, status: :unprocessable_entity
    end
  end

  private

  def reaction_params
    params.permit(:post_id)
  end
end
