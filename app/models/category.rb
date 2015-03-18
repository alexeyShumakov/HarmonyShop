class Category < ActiveRecord::Base
  acts_as_nested_set

  def get_category
    root? || !leaf? ? self_and_siblings : parent.self_and_siblings
  end


end
