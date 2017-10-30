class FromToorigin < ActiveRecord::Migration[5.0]
 def change
     rename_column :microposts, :from, :origin
  end
end
