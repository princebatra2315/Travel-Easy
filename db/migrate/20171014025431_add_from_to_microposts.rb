class AddFromToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :from, :string
  end
end
