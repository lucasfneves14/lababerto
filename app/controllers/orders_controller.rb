class OrdersController < ApplicationController
  before_action :colaborador
  layout 'system/navbar'

  def index
    @orders = Order.all
    @order_new = Order.new
  end

  def create
    @order_new = Order.create(order_params)
    @order_new.status = "Parado"
    if @order_new.save
      flash[:success] = "Pedido foi adicionado com sucesso!"
      redirect_to root_path
    else
      flash.now[:alert] = "Não foi possível cadastrar o pedido, por favor cheque o formulário!"
      @orders = Order.all
      @rollback = true
      render :index
    end
  end

  def show
    @order = Order.find(params[:id])
    @peca_new = Peca.new
    @printing_new = Printing.new
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "Pedido editado com sucesso!"
      redirect_to order_path(@order)
    else
      flash.now[:alert] = "Edição falhou! por favor cheque o formulário"
      @peca_new = Peca.new
      @printing_new = Printing.new
      @rollback_edit_order = true
      render :show
    end
  end

  def finalizar
    @order = Order.find(params[:id])
    @order.status = "Finalizado"
    if @order.save
      flash[:success] = "Pedido finalizado com sucesso!"
      redirect_to root_path
    else
      flash[:alert] = "Não foi possível finalizar o pedido. Entre em contato com a equipe de desenvolvedores!"
      redirect_to root_path
    end

  end
  


  private

  def order_params
    params.require(:order).permit(:user_id, :client,:email, :cpf,:telefone,
      :cep,:estado,:endereco,:tipo,:canal,:prazo,:preco,:frete,:descricao)
  end

  def colaborador
    unless current_user.colaborador
      flash[:alert] = "Acesso negado!"
      redirect_to initial_path
    end
  end
end
