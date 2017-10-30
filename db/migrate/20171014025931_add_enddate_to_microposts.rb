class AddEnddateToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :enddate, :string
  end
end
