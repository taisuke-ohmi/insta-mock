class PostsController < ApplicationController
  def index
    @posts = Posts.all.limit(10).includes(:photos)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |img|
          @post.photos.create(image: img)
        end
      end

      redirect_to posts_path
      flash[:alert] = "投稿が保存されました"
    else
      redirect_to posts_path
      flash[:alert] = "投稿に失敗しました"
    end
  end

  private
    def post_params
      params.require(:post).permit(:caption).merge(user_id: current_user.id)
    end
end
