# lib/reaction_service.rb
require 'grpc'
require './proto/reaction_services_pb'

class ReactionService < Reaction::Service
  def create_like(request, _unused_call)
    
    post_id = request.post_id
    user_id = request.user_id


    like = Reaction.new(post_id: post_id, user_id: user_id, liked_at: Time.now)

    if like.save
      return Reaction::CreateLikeResponse.new(message: "Like registrado exitosamente")
    else
      return Reaction::CreateLikeResponse.new(message: "No se pudo registrar el like")
    end
  end
end
