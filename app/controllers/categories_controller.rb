class CategoriesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc)
    @total_amount = @expenses.sum(:amount)
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
