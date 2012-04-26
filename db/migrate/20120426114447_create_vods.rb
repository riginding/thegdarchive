class CreateVods < ActiveRecord::Migration
  def change
    create_table :vods do |t|
      t.string :title
      t.integer :clip_id
      t.boolean :accessible
      t.integer :length
      t.references :game
      t.references :show

      t.timestamps
    end
    add_index :vods, :game_id
    add_index :vods, :show_id
  end
end
