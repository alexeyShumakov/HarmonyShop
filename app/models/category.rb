class Category < ActiveRecord::Base
  acts_as_nested_set

  def get_category
    if root?
      self_and_siblings
    elsif leaf?
      parent.self_and_siblings
    else
      self_and_siblings
    end
  end

end
