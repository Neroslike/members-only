class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @post = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
