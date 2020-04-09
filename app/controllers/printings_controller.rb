class PrintingsController < ApplicationController
  before_action :colaborador
  layout 'system/navbar'
	def create
		@peca = Peca.find(params[:id])
		@order = @peca.order
		@order.status = "Imprimindo"

		@printing_new = @peca.printings.build(printing_params)
		@printing_new.status = "Imprimindo"

		@printing_new.order_id = @order.id

		if @printing_new.save
			@order.save
			flash[:success] = "Impressão foi adicionada com sucesso!"
		    redirect_to order_path(@order)
		else
		    flash.now[:alert] = "Não foi possível cadastrar a impressão, por favor cheque o formulário!"
		    @rollback_impressao_new = @peca.id
		    @peca_new = Peca.new
		    render 'orders/show'
		end
	end

	def destroy
	    @printing = Printing.find(params[:id])
	    @order = @printing.peca.order
	    if @printing.destroy
	      if !@order.printings.where(status: "Imprimindo").any?
	      	@order.status = "Parado"
	      	@order.save
	      end
	      flash[:success] = "Impressão excluída!"
	      redirect_to order_path(@order)
	    else
	      flash[:alert] = "Não foi possível excluir a impressao. Entre em contato com a equipe de desenvolvedores!"
	      redirect_to order_path(@order)
	    end
  	end

  	def finalizar
	    @printing = Printing.find(params[:id])
	    @order = @printing.peca.order
	    @filamento = @printing.filamento



	    @printing.status = "Finalizado"
	    if @printing.save
	      if !@order.printings.where(status: "Imprimindo").any?
	      	@order.status = "Parado"
	      	@order.save
	      end
	      @filamento.massa = @filamento.massa - @printing.massa
	      @filamento.save
	      flash[:success] = "Impressão finalizada com sucesso! :)"
	      redirect_to order_path(@printing.peca.order)
	    else
	      flash[:alert] = "Não foi possível finalizar a impressão. Entre em contato com a equipe de desenvolvedores!"
	      redirect_to order_path(@printing.peca.order)
	    end
  	end



private

  def printing_params
    params.require(:printing).permit(:user_id, :printer_id,:material, :cor,:filamento_id,
      :quantidade,:tempo,:massa,:resolucao,:infill)
  end

  def colaborador
    unless current_user.colaborador
      flash[:alert] = "Acesso negado!"
      redirect_to initial_path
    end
  end


end
