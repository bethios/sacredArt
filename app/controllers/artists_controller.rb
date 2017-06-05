class ArtistsController < ApplicationController
  before_action :require_sign_in, except: :index
  before_action :authorize_user, except: :index

  def new
    @category = Category.find(params[:category_id])
    @artist = Artist.new
  end

  def create
    @category = Category.find(params[:category_id])
    @artist = @category.artists.build(artist_params)

    if @artist.save
      flash[:notice] = "Artist was saved."
      redirect_to [@artist.category, @artist]
    else
      flash.now[:alert] = "There was an error saving the artist. Please try again."
      render :edit
    end
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.assign_attributes(artist_params)

    if @artist.save
      flash[:notice] = "Artist was updated."
      redirect_to [@artist.category, @artist]
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

  def show
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :body, :main_image, :image_2, :image_3)
  end

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end
end
