class AddStaticFieldsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :flag_top, :text
    add_column :events, :flag_bottom, :text
    add_column :events, :povestka_1_text, :string
    add_column :events, :povestka_1_logo, :string
    add_column :events, :povestka_2_text, :string
    add_column :events, :povestka_2_logo, :string
    add_column :events, :povestka_3_text, :string
    add_column :events, :povestka_3_logo, :string
    add_column :events, :povestka_4_text, :string
    add_column :events, :povestka_4_logo, :string
    add_column :events, :povestka_5_text, :string
    add_column :events, :povestka_5_logo, :string
    add_column :events, :mesto_top, :text
    add_column :events, :mesto_logo, :string
    add_column :events, :mesto_bottom, :text
  end
end
