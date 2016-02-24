class PostsController < ApplicationController
  before_action :authorize
  before_action :set_post, only: [:show, :edit, :update, :destroy ]

  def index
      if params[:tag]
          @posts = @current_user.posts.tagged_with(params[:tag])
      else
          @posts = @current_user.posts.all
      end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, notice: "Successfully created posts."
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Successfully saved post."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Deleted post."
  end

  private

  def post_params
    params.require(:post).permit(:title,:tag_list,:body)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
