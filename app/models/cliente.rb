class Cliente < ActiveRecord::Base
	self.table_name = "cliente"
	set_primary_key = "codigo_cli"
	set_string = "nome_cli"
	set_string = "endereco_cli"
	set_string = "telefone_cli"
end
