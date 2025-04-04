class PostsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @posts = Post.limit(10).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])

    if @post.user_id == current_user.id
      @post.destroy
      flash[:notice] = "投稿を削除しました。"
    end
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
