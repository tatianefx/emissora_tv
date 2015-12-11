class DepartamentosController < ApplicationController
  def create
  	@departamento = Departamento.new(departamento_params)

  	if @departamento.save
  		redirect_to action: :index
  	else
  		render :new
  	end
  end

  def index
  	@departamentos = Departamento.all
  end

  def new
  	@departamento = Departamento.new
  end

  def departamento_params
  	params.require(:departamento).permit(:codigo_dep, :nome_dep)
  end
end
