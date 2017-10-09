class CreateOrganizers < ActiveRecord::Migration[5.1]
  def change
    create_table :organizers do |t|
      t.string :title
      t.string :logo

      t.timestamps
    end
  end
end
