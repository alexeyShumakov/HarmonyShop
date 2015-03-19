class Category < ActiveRecord::Base
  acts_as_nested_set

  validates :name, presence: true
  validates :page_title, presence: true
  validates :parent_id, numericality: { only_integer: true }, allow_nil: true

  def get_category
    root? || !leaf? ? self_and_siblings : parent.self_and_siblings
  end
end
