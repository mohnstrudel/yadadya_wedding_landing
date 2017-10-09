class AddSortDataToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :sortable_date, :datetime
  end
end
