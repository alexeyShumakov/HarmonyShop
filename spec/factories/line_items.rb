FactoryGirl.define do
  factory :line_item do
    product
    cart
    size "MyString"
    color "MyString"

    factory :new_line_item do
      size "new"
      color "new"
    end
  end

end
