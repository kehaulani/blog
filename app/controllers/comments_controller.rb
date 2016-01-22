class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :show, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @post.comments << @comment
      redirect_to @post, notice: "Created Comment"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to [@post,@comment], notice: "Comment Updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post
  end

  private

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title,:body)
  end
end
