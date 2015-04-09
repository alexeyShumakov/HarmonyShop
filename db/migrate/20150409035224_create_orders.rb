class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.string :pay_type
      t.string :address
      t.string :phone
      t.string :delivery_type

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
