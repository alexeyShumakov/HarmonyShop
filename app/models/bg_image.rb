class BgImage < ActiveRecord::Base
	has_attached_file :image
	validates_attachment_presence :image
	validates_attachment_content_type :image, :content_type => ["image/jpeg", "image/png"]
	validates_attachment_size :image, :less_than => 3.megabyte
end
