class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :user
      t.string :key

      t.timestamps
    end
  end
end
