class AddUrlToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :url, :string
  end
end
