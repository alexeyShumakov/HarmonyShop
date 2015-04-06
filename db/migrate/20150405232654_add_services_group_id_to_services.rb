class AddServicesGroupIdToServices < ActiveRecord::Migration
  def change
    add_reference :services, :services_group, index: true
    add_foreign_key :services, :services_groups
  end
end
