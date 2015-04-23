FactoryGirl.define do
  factory :services_group do
    title "MyString"

    factory :invalid_services_group do
      title nil
    end

    factory :new_services_group do
      title "NewString"
    end
  end

end
