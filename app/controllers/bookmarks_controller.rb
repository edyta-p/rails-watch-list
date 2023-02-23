class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]


  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # @movie = Movie.find(params[:movie_id])
    # @bookmark.movie = @movie

  end

  def create
    @list = List.find(params[:list_id])
    # @movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'new'
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
