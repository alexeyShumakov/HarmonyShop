class ServicesGroup < ActiveRecord::Base
	has_many :services
	validates :title, presence: true
end
