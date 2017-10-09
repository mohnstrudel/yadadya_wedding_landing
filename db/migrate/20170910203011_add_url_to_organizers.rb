class AddUrlToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :url, :string
  end
end
