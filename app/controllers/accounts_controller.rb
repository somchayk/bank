class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  

  def index
    @accounts = current_user.accounts
  end

  def show
  end

  def edit
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    if 
      @account.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if 
      @account.update(account_params)
      redirect_to accounts_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to root_path
  end

  private

    def account_params
      params.require(:account).permit(:name, :balance)
    end

    def set_account 
      @account = current_user.accounts.find(params[:id])
    end
end
