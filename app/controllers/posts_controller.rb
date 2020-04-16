class PostsController < ApplicationController
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # flash [:success] = "新規投稿に成功しました！"
      redirect_to post_path(@post)
    else
      render action: :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end
end