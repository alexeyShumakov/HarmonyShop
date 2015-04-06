class AddSizeHelperIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :size_helper, index: true
    add_foreign_key :products, :size_helpers
  end
end
