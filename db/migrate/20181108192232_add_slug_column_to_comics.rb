class AddSlugColumnToComics < ActiveRecord::Migration[5.2]
  def change
    add_column :comics, :slug, :string
  end
end
