class ChangePayTypeInOrder < ActiveRecord::Migration
  def change
    change_column :orders, :pay_type, 'integer USING CAST(pay_type AS integer)'
  end
end
