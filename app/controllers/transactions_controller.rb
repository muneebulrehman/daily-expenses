class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.where(user_id: current_user.id, category_id: category_id).order(created_at: :desc)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.category_id = params[:category_id]
    if @transaction.save
      flash[:success] = "Transaction created"
      redirect_to user_category_path(current_user, @transaction.category)
    else
      render :new
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end

end
