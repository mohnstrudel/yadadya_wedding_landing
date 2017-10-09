class AddFieldsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company, :string
    add_column :users, :position, :string
    add_column :users, :phone, :string
    add_column :users, :facebook, :string
  end
end
