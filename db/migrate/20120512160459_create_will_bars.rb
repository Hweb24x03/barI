class CreateWillBars < ActiveRecord::Migration
  def change
    create_table :will_bars do |t|
      t.references :user
      t.references :bar

      t.timestamps
    end
    add_index :will_bars, :user_id
    add_index :will_bars, :bar_id
  end
end
