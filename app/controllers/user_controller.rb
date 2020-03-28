class UserController < ApplicationController
	before_action :colaborador
	layout 'system/navbar'
	def solicitacoes
		@users = User.all.where(colaborador: false)
	end

	def update_solicitacao
		@user = User.find(params[:id])
		if params[:user][:relacionamento] != ""
			if @user.update(user_params)
				if @user.relacionamento == "Colaborador"
					@user.colaborador = true
				elsif @user.relacionamento == "Administrador"
					@user.colaborador = true
					@user.admin = true
				end
				@user.save
				flash[:success] = "Um novo #{@user.relacionamento} foi adicionado ao sistema."
				redirect_to solicitacoes_path
			else
				flash.now[:error] = "Edição falhou! Por favor cheque o formulário"
				render :solicitacoes
			end
		else
			flash.now[:danger] = "Edição falhou! Por favor, escolha o tipo de relacionamento que o Usuário possui com o LAB"
			@users = User.all.where(colaborador: false)
			render :solicitacoes
		end
	end




  	private

  	def user_params
  		params.require(:user).permit(:relacionamento, :admin, :colaborador)
	end




  	def colaborador
    	unless current_user.colaborador
	      flash[:alert] = "Acesso negado!"
	      redirect_to initial_path
	    end
	end


end
