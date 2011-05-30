class CommentsController < ApplicationController
  before_filter :login_required

  respond_with :html, :xml

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
    respond_with(@post, @comment)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Comment has not been created."
      render :action => "new"
    end
  end

end

