class HomesController < ApplicationController
  def index; end

  def show
    if params[:id] == 'sign_out'
      sign_out current_user
      redirect_to new_user_session_path
    else
      @user = current_user
      @first_user = @user
    end
  end
end
