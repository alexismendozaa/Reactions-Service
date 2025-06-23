require 'minitest/autorun'

class GemfileTest < Minitest::Test
  def test_gemfile_exists
    gemfile_path = File.join(File.dirname(__FILE__), '../Gemfile')

    # Obtener el nombre del microservicio desde el directorio principal (un nivel arriba)
    microservice_name = File.basename(File.expand_path('..'))

    # Verificamos si el Gemfile existe
    if File.exist?(gemfile_path)
      puts "Prueba de funcionalidad en el microservicio '#{microservice_name}' Superada"
    end

    # Aseguramos que el Gemfile exista
    assert File.exist?(gemfile_path), 'Gemfile does not exist in the root directory'
  end
end
