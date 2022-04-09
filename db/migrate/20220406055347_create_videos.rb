class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.integer :member_id, null: false
      t.integer :genre_id, null: false
      t.string :title
      t.text :explanation


      t.timestamps
    end
  end
end
