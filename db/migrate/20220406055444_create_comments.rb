class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :member_id, null: false
      t.integer :video_id, null: false
      t.text :comment

      t.timestamps
    end
  end
end
