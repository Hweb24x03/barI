class AddCacheAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cache_at, :datetime

  end
end
