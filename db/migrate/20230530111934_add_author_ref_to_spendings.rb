class AddAuthorRefToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_reference :spendings, :author, foreign_key: { to_table: :users }
  end
end
