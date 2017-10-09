class AddFacebookToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :facebook, :string
  end
end
