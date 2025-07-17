class User < ApplicationRecord
  # Establecer la conexión con la base de datos de usuarios
  self.abstract_class = true
  establish_connection :users

  # Especificar el nombre exacto de la tabla en la base de datos 'users'
  self.table_name = 'Users'  # La tabla tiene mayúscula, por eso es necesario especificarlo
end
