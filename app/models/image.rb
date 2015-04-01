class Image < ActiveRecord::Base
  has_attached_file :photo,
                    :styles => { :large => "450x600>", :small => "80x100>", :thumb => "250x330>" },
                    :default_url => "/images/:style/default_product_average.png"
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpeg", "image/png"]
  validates_attachment_size :photo, :less_than => 3.megabyte
  belongs_to :products_color
end
