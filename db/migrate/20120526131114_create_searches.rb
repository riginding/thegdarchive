class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :game_id
      t.integer :show_id

      t.timestamps
    end
  end
end
