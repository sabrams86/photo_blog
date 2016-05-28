class CommentsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build(comment_params)
    if @comment.save
      redirect_to @photo
    else
      render @photo
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
