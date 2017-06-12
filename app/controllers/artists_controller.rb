class ArtistsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index

  def new
    @category = Category.find(params[:category_id])
    @artist = Artist.new
  end

  def create
    @artist = Artist.new
    @artist.name = params[:artist][:name]
    @artist.body = params[:artist][:body]
    @artist.main_image = params[:artist][:main_image]
    @artist.image_2 = params[:artist][:image_2]
    @artist.image_3 = params[:artist][:image_3]

    @category = Category.find(params[:category_id])
    @artist.category_id = params[:category_id]

    if @artist.save
      flash[:notice] = "Artist was saved."
      redirect_to [@category]
    else
      flash.now[:alert] = "There was an error saving the artist. Please try again."
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.name = params[:artist][:name]
    @artist.body = params[:artist][:body]
    @artist.main_image = params[:artist][:main_image]
    @artist.image_2 = params[:artist][:image_2]
    @artist.image_3 = params[:artist][:image_3]

    if @artist.save
      flash[:notice] = "Artist was updated."
      redirect_to [@artist.category]
    else
      flash.now[:alert] = "There was an error saving the artist. Please try again."
      render :edit
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def destroy
    @artist = Artist.find(params[:id])

    if @artist.destroy
      flash[:notice] = "\"#{@artist.name}\" was deleted successfully."
      redirect_to @artist.category
    else
      flash.now[:alert] = "There was an error deleting the artist."
      render @artist.category
    end
  end

  def index
    @artists = Artist.all
  end

  private

  def authorize_user
    unless current_user.role == 'admin'
      flash[:alert] = "You must be an admin to do that."
      redirect_to index_path
    end
  end
end
