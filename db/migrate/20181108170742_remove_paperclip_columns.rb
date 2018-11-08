class RemovePaperclipColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :image_file_name
    remove_column :pages, :image_content_type
    remove_column :pages, :image_file_size
    remove_column :pages, :image_updated_at
  end
end
