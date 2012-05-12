class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :shop_id
      t.text :json

      t.timestamps
    end
  end
end
