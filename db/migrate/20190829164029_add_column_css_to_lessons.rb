class AddColumnCssToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :css, :text
  end
end
