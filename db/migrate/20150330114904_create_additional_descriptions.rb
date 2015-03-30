class CreateAdditionalDescriptions < ActiveRecord::Migration
  def change
    create_table :additional_descriptions do |t|
      t.string :name
      t.string :description
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :additional_descriptions, :products
  end
end
