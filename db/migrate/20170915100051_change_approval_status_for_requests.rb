class ChangeApprovalStatusForRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :requests, :approval_status, :string
  end
end
