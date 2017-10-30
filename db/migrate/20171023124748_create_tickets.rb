class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.text :origin
      t.text :destination
      t.text :price
      t.date :journeydate

      t.timestamps
    end
  end
end
