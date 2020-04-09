class FilamentosController < ApplicationController
	before_action :colaborador
	layout 'system/navbar'
	def index
		@filamentos = Filamento.all
		@groups = @filamentos.group_by(&:material)
		@filamento_new = Filamento.new
	end

	def create
		@filamento_new = Filamento.create(filamento_params)
		if @filamento_new.dono == 'Outro'
			@filamento_new.dono = @filamento_new.dono_aux
		end
		if @filamento_new.material == 'Outro'
			@filamento_new.material = @filamento_new.material_aux
		end
		if @filamento_new.cor == 'Outro'
			@filamento_new.cor = @filamento_new.cor_aux
		end
		if @filamento_new.save
			flash[:success] = "O filamento foi adicionado com sucesso!"
			redirect_to filamentos_path
		else
			flash.now[:alert] = "Não foi possível cadastrar o filamento, por favor cheque o formulário!"
			@filamentos = Filamento.all
			@groups = @filamentos.group_by(&:material)
			@rollback = true
			render :index
		end
	end


	def get_filamentos
	    @filamentos = Filamento.where(material: params[:material_id]).where(cor: params[:cor_id])
	    respond_to do |format|
	      format.json { render :json => @filamentos }
	    end
	end




	private

	def filamento_params
    	params.require(:filamento).permit(:dono,:dono_aux,:material,:material_aux, :cor, :cor_aux,:massa, :diametro,:fechado)
  	end


  	def colaborador
    	unless current_user.colaborador
	      flash[:alert] = "Acesso negado!"
	      redirect_to initial_path
	    end
	end



end
