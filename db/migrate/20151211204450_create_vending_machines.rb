class CreateVendingMachines < ActiveRecord::Migration

  def self.up
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    create_table :vending_machines do |t|

      t.string  :model
      t.string  :description
      t.integer :owner_id
      t.integer :max_capacity
      t.integer :max_change
      t.hstore  :change

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :vending_machines
  end
end
