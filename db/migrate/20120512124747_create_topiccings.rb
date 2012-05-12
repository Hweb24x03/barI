class CreateTopiccings < ActiveRecord::Migration
  def change
    create_table :topiccings do |t|
      t.references :user
      t.references :topic

      t.timestamps
    end
    add_index :topiccings, :user_id
    add_index :topiccings, :topic_id
  end
end
