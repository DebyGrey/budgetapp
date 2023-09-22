class HomesController < ApplicationController
  def index
    @categories = Group.where(author_id: current_user.id)
  end

  def new
    @category = Group.new
  end

  def create
    @category = Group.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to homes_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Group.find(params[:id])
    @transactions = @category.transactions
    @total_amount = @transactions.sum(:amount)
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon)
  end
end
