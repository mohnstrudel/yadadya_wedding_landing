class AddZipToArchives < ActiveRecord::Migration[5.1]
  def change
    add_column :archives, :zip, :string
  end
end
