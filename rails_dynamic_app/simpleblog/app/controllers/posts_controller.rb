class PostsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "111Q", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to(action: 'show', id: @post.id)
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to home_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
