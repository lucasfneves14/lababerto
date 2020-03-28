class OrdersController < ApplicationController
  before_action :colaborador
  layout 'system/navbar'

  def index
  end

  


  private

  def colaborador
    unless current_user.colaborador
      flash[:alert] = "Acesso negado!"
      redirect_to initial_path
    end
  end
end
