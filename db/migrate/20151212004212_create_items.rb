class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.integer :vending_machine_id
      t.float   :price
      t.integer :quantity
      t.string  :description

      t.timestamps null: false
    end
  end
end
