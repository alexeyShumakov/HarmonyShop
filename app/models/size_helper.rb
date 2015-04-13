class SizeHelper < ActiveRecord::Base
	has_many :product
	validates :title, presence: true
	validates :body, presence: true
end
