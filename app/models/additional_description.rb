class AdditionalDescription < ActiveRecord::Base
  belongs_to :product
  validates :name, presence: true
  validates :description, presence: true
end
