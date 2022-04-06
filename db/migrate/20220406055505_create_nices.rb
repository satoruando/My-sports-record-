class CreateNices < ActiveRecord::Migration[6.1]
  def change
    create_table :nices do |t|
      t.integer :member_id, null: false
      t.integer :video_id,

      t.timestamps
    end
  end
end
