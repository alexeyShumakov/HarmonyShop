class CreateBgImages < ActiveRecord::Migration
  def change
    create_table :bg_images do |t|
      t.string :title
      t.boolean :current, default: true

      t.timestamps null: false
    end
  end
end
