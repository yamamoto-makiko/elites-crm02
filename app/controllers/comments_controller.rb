class CommentsController < ApplicationController

  def index

  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    
    # 08-2_基本課題
    if @comment.valid?
      @comment.save
      redirect_to customer_path(@comment.customer_id)
    else
      @customer = @comment.customer
      @comments = @customer.comments
      render template: "customers/show"
    end
  end

  def edit

  end

  def update

  end
  
  def destroy
    @comment = Comment.find(params[:id])
    customer_id = @comment.customer_id
    @comment.destroy
    redirect_to customer_path(customer_id)
  end
  
  
  private

  def comment_params
    params.require(:comment).permit(:body, :customer_id, :user_id)
  end
  
end
