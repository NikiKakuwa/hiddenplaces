class CommentsController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        @comment = current_user.comments.new(comment_params)
        @comment.post_id = post.id
        if @comment.save
            redirect_to post_path(post)
            flash[:success] = 'New comment created successfully!!!'
        else
            @post = Post.find(params[:post_id])
            @user = current_user
            @new_post = Post.new
            render 'posts/show'
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to post_path(params[:post_id])
        flash[:success] = 'successfully destroyed!!!'
    end

    private
    def comment_params
        params.require(:comment).permit(:comment, :post_id)
    end
end
