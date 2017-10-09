class AddStatusesToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :payment_status, :boolean
    add_column :requests, :approval_status, :boolean
  end
end
