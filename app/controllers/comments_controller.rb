class CommentsController < ApplicationController

  http_basic_authenticate_with :name => "iza", :password => "1234", :only => :destroy

  def create
    @comment = current_user.comments.build(params[:comment])
    @post = Post.find(params[:post_id])
    @user = current_user
   # @comment = @post.comments.create(body: "cos tam", commenter: "costam")
    @comment.user_id = current_user.id
    @comment.post_id = @post.id


    @comment.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
