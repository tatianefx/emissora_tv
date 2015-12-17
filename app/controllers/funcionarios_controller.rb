class FuncionariosController < ApplicationController
	def create
  	@funcionario = Funcionario.new(funcionario_params)

  	if @funcionario.save
  		redirect_to action: :index
  	else
  		render :new
  	end
  end

  def index
  	@funcionarios = Funcionario.all
  end

  def new
  	@funcionario = Funcionario.new
  end
  
  private

  def funcionario_params
    params.require(:funcionario).permit(:codigo_fun, :nome_fun, :cpf_fun, :data_nasc_fun, :salario_fun, :sexo, :cod_dep)
  end
end