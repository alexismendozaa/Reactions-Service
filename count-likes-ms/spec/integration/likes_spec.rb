require 'swagger_helper'

describe 'Likes API' do
  path '/likes' do
    post 'Registrar un like' do
      tags 'Likes'
      consumes 'application/json'
      
      # Parametros esperados en el cuerpo de la solicitud
      parameter name: :post_id, in: :body, required: true, description: 'ID del post al que se dará like', schema: {
        type: :object,
        properties: {
          post_id: { type: :string, example: 'UUID_DEL_POST' }
        }
      }

      # Respuesta esperada para una solicitud exitosa
      response '201', 'like registrado' do
        let(:Authorization) { 'YOUR_JWT_TOKEN' } # Aquí pones el token directamente para prueba
        let(:post_id) { 'uuid_del_post' }
        run_test!
      end

      # Respuesta para error de validación
      response '400', 'parámetros inválidos' do
        let(:Authorization) { 'YOUR_JWT_TOKEN' }
        let(:post_id) { nil }
        run_test!
      end
    end
  end
end
