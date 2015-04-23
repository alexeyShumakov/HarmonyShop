FactoryGirl.define do
  factory :service do
    title "MyString"
    body "MyText"

    factory :invalid_service do
      title nil
      body nil
    end
    factory :new_service do
      title "NewString"
      body "NewText"
    end
  end

end
