class AddFacebookToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :facebook, :string
  end
end
