class CreateSizeHelpers < ActiveRecord::Migration
  def change
    create_table :size_helpers do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
