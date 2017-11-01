class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = current_user.posts.find_by(id: params[:id])
  end

  def update
    @post = current_user.posts.find_by(id: params[:id])
    if @post && @post.update_attributes(post_params)

    else
      flash.now[:errors] = ["Invalid"]
      render :edit
    end
  end

  def show
    @post = current_user.posts.find_by(id: params[:id])
  end

  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids:[])
  end
end
