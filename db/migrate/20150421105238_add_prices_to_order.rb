class AddPricesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :total_price, :decimal, precision: 8, scale: 2
    add_column :orders, :delivery_price, :decimal, precision: 8, scale: 2
  end
end
