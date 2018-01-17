class AddModeToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :mode, :string
  end
end
