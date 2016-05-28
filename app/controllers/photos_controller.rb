class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to(@photo)
    else
      render new
    end
  end

  def destroy
    if Photo.find(params[:id]).destroy
      redirect_to photos_path
    else
      redirect_to(@photo)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :name)
  end

end
