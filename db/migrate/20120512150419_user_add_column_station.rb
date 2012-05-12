class UserAddColumnStation < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :station
    end
  end
end
