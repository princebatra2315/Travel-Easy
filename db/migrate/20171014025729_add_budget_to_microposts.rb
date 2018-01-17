class AddBudgetToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :budget, :string
  end
end
