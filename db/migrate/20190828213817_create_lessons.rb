class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.text :template
      t.text :lesson
    end
  end
end
