class TransactionsController < ApplicationController
    before_action :authenticate_user!

  def new
    @category = Group.find(params[:category_id])
    @transaction = @category.transactions.build
  end

  def create
    @category = Group.find(params[:category_id])
    @transaction = @category.transactions.build(transaction_params)
    @transaction.author = current_user

    if @transaction.save
      redirect_to category_path(@category), notice: 'Transaction added successfully'
    else
      puts @transaction.errors.full_messages # Add this line for debugging
      render :new
    end
  end

  private

  def transaction_params
    params.require(:entity).permit(:name, :amount, category_ids: [])
  end
end
