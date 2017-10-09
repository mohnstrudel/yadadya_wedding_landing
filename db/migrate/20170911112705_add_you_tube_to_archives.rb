class AddYouTubeToArchives < ActiveRecord::Migration[5.1]
  def change
    add_column :archives, :youtube, :string
  end
end
