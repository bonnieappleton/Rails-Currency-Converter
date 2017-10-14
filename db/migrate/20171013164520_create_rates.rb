class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :currency, limit: 3
      t.decimal :rate, :precision => 10, :scale => 5
      t.date :date

      t.timestamps
    end
  end
end
