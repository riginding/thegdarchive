class AddViewsToVods < ActiveRecord::Migration
  def change
    add_column :vods, :views, :integer
  end
end
