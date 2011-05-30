class PostsController < ApplicationController

  before_filter :login_required, :except => [:index, :show]
  respond_to :html, :xml

  def index
    @posts = Post.all
    @popular_posts = Post.popular_posts
    respond_with(@popular_posts, @posts)
  end

  def new
    @post = current_user.posts.new
    respond_with(@post)
  end

  def create
    @post = current_user.posts.new(params[:post])
    flash[:notice] = @post.save ?  "Post has been created." : "Post has not been created."
    respond_with(@post)
  end

  def show
    @post = Post.find(params[:id])
    @recent_commenters =  @post.recent_commenters(5)
    @comment = Comment.new
    respond_with(@post, @comment)
  end

end

