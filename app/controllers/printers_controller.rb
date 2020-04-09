class PrintersController < ApplicationController
	before_action :colaborador
	layout 'system/navbar'
	def index
		@printers = Printer.all
		@printer_new = Printer.new
	end


	def create
		@printer_new = Printer.create(printer_params)
		if @printer_new.modelo == 'Outro'
			@printer_new.modelo = @printer_new.modelo_aux
		end
		if @printer_new.tipo == 'Outro'
			@printer_new.tipo = @printer_new.tipo_aux
		end
		if @printer_new.save
			flash[:success] = "A impressora foi adicionada com sucesso!"
			redirect_to printers_path
		else
			flash.now[:alert] = "Não foi possível cadastrar a impressora, por favor cheque o formulário!"
			@printers = Printer.all
			@rollback = true
			render :index
		end
	end


	def update
		@printer = Printer.find(params[:id])
		if @printer.update(printer_params)
			if @printer.modelo == 'Outro'
				@printer.modelo = @printer.modelo_aux
			end
			if @printer.tipo == 'Outro'
				@printer.tipo = @printer.tipo_aux
			end
			@printer.save
			flash[:success] = "Impressora editada com sucesso!"
			redirect_to printers_path
		else
			flash.now[:alert] = "Edição falhou! por favor cheque o formulário"
			@printers = Printer.all
			@printer_new = Printer.new
			@rollback_edit = @printer.id
			render :index
		end
	end

	def destroy
	    @printer = Printer.find(params[:id])
	    if @printer.destroy
	      flash[:success] = "Impressora excluída!"
	      redirect_to printers_path
	    else
	      flash[:alert] = "Não foi possível excluir a impressora. Entre em contato com a equipe de desenvolvedores!"
	      redirect_to printers_path
	    end
  	end



	private

	def printer_params
    	params.require(:printer).permit(:name,:modelo,:modelo_aux, :tipo,:tipo_aux,:x,:y,:z,:attachment,:fechada)
  	end


  	def colaborador
    	unless current_user.colaborador
	      flash[:alert] = "Acesso negado!"
	      redirect_to initial_path
	    end
	end
end
