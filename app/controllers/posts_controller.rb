class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destory]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Object successfully created"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def show
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated"
      redirect_to @post
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
  

  def edit
  end
  
  def destroy
    if @post.destroy
      flash[:success] = 'Post was successfully deleted.'
      redirect_to posts_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to posts_path
    end
  end
  
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
