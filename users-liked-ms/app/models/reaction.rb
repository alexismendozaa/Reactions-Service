class Reaction < ApplicationRecord
  self.primary_key = 'id'

  # Validar que un usuario solo pueda dar un like a la misma publicación una vez
  validates :user_id, uniqueness: { scope: :post_id, message: 'You can only like a post once' }
end
