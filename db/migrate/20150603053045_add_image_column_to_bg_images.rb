class AddImageColumnToBgImages < ActiveRecord::Migration
	def up
		add_attachment :bg_images, :image
	end

	def down
		remove_attachment :bg_images, :image
	end
end
