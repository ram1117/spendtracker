class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.text :name
      t.decimal :amount

      t.timestamps
    end
  end
end
