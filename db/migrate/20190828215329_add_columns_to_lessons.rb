class AddColumnsToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :difficulty, :integer
  end
end
