class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  acts_as_nested_set

  validates :name, presence: true
  validates :page_title, presence: true
  validates :parent_id, numericality: { only_integer: true }, allow_nil: true

  def get_category
    root? || !leaf? ? self_and_siblings : parent.self_and_siblings
  end
end
