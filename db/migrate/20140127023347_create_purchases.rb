class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.references :item
      t.references :purchaser
      t.references :merchant

      t.timestamps
    end
  end
end
