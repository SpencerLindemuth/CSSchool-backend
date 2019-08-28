class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :user_id
      t.integer :lesson_id
    end
  end
end
