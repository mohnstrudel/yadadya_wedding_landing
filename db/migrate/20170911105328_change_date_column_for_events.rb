class ChangeDateColumnForEvents < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :date, :string
  end
end
