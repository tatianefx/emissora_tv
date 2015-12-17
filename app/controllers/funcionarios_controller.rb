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
  
  def the_best_salary
    
    @salario = Funcionario.maximum(:salario_fun)
    @funcionario = Funcionario.select(:nome_fun, :salario_fun).where(:salario_fun =>  @salario).map(&:nome_fun)
    render :json => @salario

  end

  private

  def funcionario_params
    params.require(:funcionario).permit(:codigo_fun, :nome_fun, :cpf_fun, :data_nasc_fun, :salario_fun, :sexo, :cod_dep)
  end
end