class AddNameToServicesGroups < ActiveRecord::Migration
  def change
    add_column :services_groups, :name, :string
  end
end
