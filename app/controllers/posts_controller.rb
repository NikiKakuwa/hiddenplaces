class PostsController < ApplicationController
  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      # flash [:success] = "新規投稿しました！"
      redirect_to post_path(@post)
    else
      render action: :new
    end
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @new_post = Post.new
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
       #flash[:success] = '編集しました!'
       redirect_to post_path(@post)
    else
      render action: :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
    #flash[:success] = '投稿を削除しました！'
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :post_image)
  end
end