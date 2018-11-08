class PagesController < ApplicationController
  def show
    @comic = Comic.find params[:comic_id]
    @page = @comic.pages.find_by number: params[:id]
    render :missing if @page.nil?
  end
end
