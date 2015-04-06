class CreateServicesGroups < ActiveRecord::Migration
  def change
    create_table :services_groups do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
