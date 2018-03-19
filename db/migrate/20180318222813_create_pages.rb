class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.integer :comic_id
      t.integer :number
      t.timestamps
    end
  end
end
