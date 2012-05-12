class AddPrefCodeToBars < ActiveRecord::Migration
  def change
    add_column :bars, :pref_code, :integer

  end
end
