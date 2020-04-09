class PecasController < ApplicationController
  before_action :colaborador
  layout 'system/navbar'


  def create
  	@order = Order.find(params[:id])
    @peca_new = Peca.create(peca_params)
    @peca_new.order_id = @order.id

    if @peca_new.material == 'Outro'
			@peca_new.material = @peca_new.material_aux
	end
	if @peca_new.cor == 'Outro'
			@peca_new.cor = @peca_new.cor_aux
	end
    if @peca_new.save
      flash[:success] = "Peça foi adicionada com sucesso!"
      redirect_to order_path(@order)
    else
      flash.now[:alert] = "Não foi possível cadastrar a peça, por favor cheque o formulário!"
      @rollback_peca_new = true
      @printing_new = Printing.new
      puts @peca_new
      render 'orders/show'
    end
  end 


  def update
  	@peca = Peca.find(params[:id])
  	@order = @peca.order
	if @peca.update(peca_params)
		if @peca.material == 'Outro'
			@peca.material = @peca.material_aux
		end
		if @peca.cor == 'Outro'
			@peca.cor = @peca.cor_aux
		end
		@peca.save
		flash[:success] = "Peça editada com sucesso!"
		redirect_to order_path(@order)
	else
		flash.now[:alert] = "Edição falhou! por favor cheque o formulário"
		@peca_new = Peca.new
		@printing_new = Printing.new
		@rollback_peca_edit = @peca.id
		render 'orders/show'
	end
end
def destroy
	    @peca = Peca.find(params[:id])
	    if @peca.destroy
	      flash[:success] = "Peça excluída!"
	      redirect_to order_path(@peca.order)
	    else
	      flash[:alert] = "Não foi possível excluir a impressora. Entre em contato com a equipe de desenvolvedores!"
	      redirect_to order_path(@peca.order)
	    end
  	end


  private

  def peca_params
    params.require(:peca).permit(:name,:tempo,:massa,:quantidade,:resolucao,
    	:infill,:cor,:cor_aux, :material, :material_aux, :attachment)
  end

  def colaborador
    unless current_user.colaborador
      flash[:alert] = "Acesso negado!"
      redirect_to initial_path
    end
  end
end
