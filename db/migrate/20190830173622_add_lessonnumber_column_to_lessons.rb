class AddLessonnumberColumnToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :lesson_number, :integer
  end
end
