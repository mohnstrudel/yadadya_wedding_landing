class AddLogoStyleToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :logo_additional_css, :string
  end
end
