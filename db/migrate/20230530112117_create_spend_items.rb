class CreateSpendItems < ActiveRecord::Migration[7.0]
  def change
    create_table :spend_items do |t|

      t.timestamps
    end
  end
end
