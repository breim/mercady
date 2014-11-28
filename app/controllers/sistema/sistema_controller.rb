class Sistema::SistemaController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_user

  
  private
  
  def verify_user
    unless current_user
      redirect_to root_path, :alert => 'Área Restrita.'
    end
  end
end
