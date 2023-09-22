class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = @category.expenses.build(expense_params)
    @expense.author = current_user

    if @expense.save
      redirect_to category_path(@category), notice: 'Expenditure added successfully'
    else
      puts @expense.errors.full_messages # Add this line for debugging
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end
end
