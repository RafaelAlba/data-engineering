class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :purchaser_name
      t.integer :purchase_count
      t.references :item
      t.references :merchant

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
