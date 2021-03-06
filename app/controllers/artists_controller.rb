class ArtistsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user
  before_action :find_artist, except: [:new, :create]
  before_action :find_category

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new
    @artist.category_id = params[:category_id]

    if @artist.update_attributes(artist_params)
      flash[:notice] = "Artist was saved."
      redirect_to category_path(params[:category_id])
    else
      flash.now[:alert] = @artist.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if params[:artist][:delete_main] == '1'
      @artist.main_image = nil
    end
    if params[:artist][:delete_image_2] == '1'
      @artist.image_2 = nil
    end
    if params[:artist][:delete_image_3] == '1'
      @artist.image_3 = nil
    end

    if @artist.update_attributes(artist_params)
      flash[:notice] = "Artist was updated."
      redirect_to category_path(params[:category_id])
    else
      flash.now[:alert] = @artist.errors.full_messages.to_sentence
      render :edit
    end

  end

  def edit
  end

  def destroy
    if @artist.destroy
      flash[:notice] = "\"#{@artist.name}\" was deleted successfully."
      redirect_to category_path(params[:category_id])
    else
      flash.now[:alert] = @artist.errors.full_messages.to_sentence
      redirect_to category_path(params[:category_id])
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

  def artist_params
    params.require(:artist).permit(:name, :body, :main_image, :image_2, :image_3)
  end

  def find_artist
    @artist = Artist.find(params[:id].to_i)
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

end
