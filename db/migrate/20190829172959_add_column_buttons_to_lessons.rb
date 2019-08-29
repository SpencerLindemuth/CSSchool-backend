class AddColumnButtonsToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :button_one_text, :string
    add_column :lessons, :button_two_text, :string
    add_column :lessons, :button_three_text, :string
    add_column :lessons, :button_four_text, :string
    add_column :lessons, :button_one_action_css, :string
    add_column :lessons, :button_two_action_css, :string
    add_column :lessons, :button_three_action_css, :string
    add_column :lessons, :button_four_action_css, :string
  end
end
