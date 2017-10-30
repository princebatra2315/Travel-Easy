class AddStartdateToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :startdate, :string
  end
end
