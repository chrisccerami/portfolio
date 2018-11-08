class Admin::ComicsController < AdminController
  def index
    @comics = Comic.all
  end

  def new
    @comic = Comic.new
  end

  def edit
    @comic = Comic.find params[:id]
  end

  def create
    @comic = Comic.new comic_params
    @comic.slug = @comic.title.parameterize

    if @comic.save
      redirect_to admin_comics_path
    else
      render :new
    end
  end

  def update
    @comic = Comic.find params[:id]

    if @comic.update comic_params
      flash[:notice] = "Comic Updated"
      redirect_to admin_comics_path
    else
      render :edit
    end
  end

  private

  def comic_params
    hash = params.require(:comic).permit(:title, :description)
    hash[:slug] = hash[:title].parameterize
    hash
  end
end
