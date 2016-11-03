class CustomersController < ApplicationController

  #09-1_基本課題 
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_user!

  # 08-1_基本課題
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    # @customers = Customer.all
    # @customers = Customer.page(params[:page])
    @q = Customer.search(params[:q])
    @customers = @q.result(distinct: true).page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
    # 08-1_基本課題
    # @customer = Customer.find(params[:id])
  end

  def update
    # 08-1_基本課題
    # @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    # 08-1_基本課題
    # @customer = Customer.find(params[:id])
    @comment = Comment.new 
    # @comments = Comment.where(customer_id: params[:id].to_i)
    @comments = @customer.comments
  end

  def destroy
    # 08-1_基本課題
    # @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id,
      :post_id
      )
  end

  # 08-1_基本課題
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
end
