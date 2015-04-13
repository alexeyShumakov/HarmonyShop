FactoryGirl.define do
  factory :size_helper do
    title "MyString"
    body "MyText"

    factory :invalid_size_helper do
      body nil
    end

    factory :new_size_helper do
      title "NewString"
      body "NewText"
    end
  end

end
