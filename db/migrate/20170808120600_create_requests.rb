class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :position
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
