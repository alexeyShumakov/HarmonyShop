FactoryGirl.define do
  factory :image do
    name "MyString"
    products_color
    photo Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/default_product_average.png', 'image/png')

    factory :new_image do
      name "new"
    end
  end

end
