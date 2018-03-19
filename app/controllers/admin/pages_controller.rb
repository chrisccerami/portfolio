class Admin::PagesController < AdminController
  before_action :set_comic

  def index
  end

  def new
    @page = @comic.pages.new
  end

  def edit
    @page = @comic.pages.find params[:id]
  end

  def create
    @page = @comic.pages.new page_params
    if @page.save
      flash[:notice] = "Page Uploaded"
      redirect_to admin_comic_pages_path
    else
      flash[:error] = @page.errors.full_messages
      render :new
    end
  end

  def update
    @page = @comic.pages.find params[:id]
    if @page.update page_params
      flash[:notice] = "Page Updated"
      redirect_to admin_comic_pages_path
    else
      binding.pry
      flash[:error] = @page.errors.full_messages
      render :edit
    end
  end

  private

  def set_comic
    @comic = Comic.find params[:comic_id]
  end

  def page_params
    params.require(:page).permit(:number, :image)
  end
end
