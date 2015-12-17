class Departamento < ActiveRecord::Base
	self.table_name = "departamento"
	set_primary_key = "codigo_dep"
	set_string = "nome_dep"

	has_many :funcionario
end
