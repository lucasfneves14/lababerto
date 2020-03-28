class InitialController < ApplicationController
  layout :resolve_layout

  def show
  end


  private
  def resolve_layout
    case action_name
    when "edit"
      true
    else
      "users/navbar"
    end
  end
end
