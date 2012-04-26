class CreateTimestamps < ActiveRecord::Migration
  def change
    create_table :timestamps do |t|
      t.string :content
      t.integer :timeat
      t.references :vod

      t.timestamps
    end
    add_index :timestamps, :vod_id
  end
end
