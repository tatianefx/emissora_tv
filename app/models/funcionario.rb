class Funcionario < ActiveRecord::Base
	self.table_name = "funcionario"
	set_primary_key = "codigo_fun"
  set_string 			= "nome_fun"
  set_string 			= "cpf_fun"
  set_date 				= "data_nasc_fun"
  set_float 			= "salario_fun"
  set_string 			= "sexo"
  set_integer 		= "cod_dep"

  belongs_to :departamento
end
