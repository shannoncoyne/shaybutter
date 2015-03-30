class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    authenticate
    @post = Post.new
  end

  def edit
    authenticate
    @post = Post.find(params[:id])
  end

  def create
    auhenticate
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    authenticate
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    authenticate
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
