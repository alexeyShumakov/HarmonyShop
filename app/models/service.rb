class Service < ActiveRecord::Base
	belongs_to :services_group
	validates :title, presence: true
	validates :body, presence: true
end
