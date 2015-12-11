class ClientesController < ApplicationController
	def create
  	@cliente = Cliente.new(cliente_params)

  	if @cliente.save
  		redirect_to action: :index
  	else
  		render :new
  	end
  end

  def index
  	@clientes = Cliente.all
  end

  def new
  	@cliente = Cliente.new
  end

  def cliente_params
  	params.require(:cliente).permit(:codigo_cli, :nome_cli, :endereco_cli, :telefone_cli)
  end
end
