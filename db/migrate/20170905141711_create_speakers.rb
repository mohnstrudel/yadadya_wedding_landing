class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.string :picture
      t.string :last_name
      t.string :first_name
      t.text :description
      t.string :facebook
      t.string :company
      t.string :position

      t.timestamps
    end
  end
end
