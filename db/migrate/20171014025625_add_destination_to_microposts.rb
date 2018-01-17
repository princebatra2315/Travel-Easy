class AddDestinationToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :destination, :string
  end
end
