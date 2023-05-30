class AddRefToSpendItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :spend_items, :category, foreign_key: { to_table: :categories }
    add_reference :spend_items, :spending, foreign_key: { to_table: :spendings }
  end
end
