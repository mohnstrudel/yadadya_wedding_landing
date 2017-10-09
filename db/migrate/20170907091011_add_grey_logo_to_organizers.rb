class AddGreyLogoToOrganizers < ActiveRecord::Migration[5.1]
  def change
    add_column :organizers, :logo_grey, :string
  end
end
