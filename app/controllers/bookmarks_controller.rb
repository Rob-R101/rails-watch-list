class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully created."
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id]) # Correctly find the bookmark using params[:id]
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id), notice: "Bookmark was successfully deleted."
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
