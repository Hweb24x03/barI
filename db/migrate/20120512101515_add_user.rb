class AddUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.integer :sex
      t.integer :age
      t.integer :pref_code
    end
  end
end
