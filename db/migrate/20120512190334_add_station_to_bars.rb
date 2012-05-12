class AddStationToBars < ActiveRecord::Migration
  def change
    add_column :bars, :station, :string

  end
end
