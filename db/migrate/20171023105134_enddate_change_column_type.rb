class EnddateChangeColumnType < ActiveRecord::Migration[5.0]
     def change
        change_column(:microposts, :enddate, :date)
    end

end
