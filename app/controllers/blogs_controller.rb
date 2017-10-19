class BlogsController < ApplicationController
  before_action :authorize_user, except: [:index]
  before_action :find_blog, except: [:new, :create, :index]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Blog was saved."
      redirect_to blogs_path
    else
      flash.now[:alert] = @blog.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update_attributes(blog_params)
      flash[:notice] = "Blog was updated."
      redirect_to blogs_path
    else
      flash.now[:alert] = @blog.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @blog.destroy
      flash[:notice] = "\"#{@blog.title}\" was deleted successfully."
      redirect_to blogs_path
    else
      flash.now[:alert] = @blog.errors.full_messages.to_sentence
      redirect_to blogs_path
    end
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :body)
  end

  def find_blog
    @blog = Blog.find(params[:id].to_i)
  end

end
