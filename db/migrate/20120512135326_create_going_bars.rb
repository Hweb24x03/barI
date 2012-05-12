class CreateGoingBars < ActiveRecord::Migration
  def change
    create_table :going_bars do |t|
      t.references :user
      t.references :bar

      t.timestamps
    end
    add_index :going_bars, :user_id
    add_index :going_bars, :bar_id
  end
end
