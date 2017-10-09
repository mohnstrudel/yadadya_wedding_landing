class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.string :place
      t.float :long
      t.float :lat
      t.string :address

      t.timestamps
    end
  end
end
