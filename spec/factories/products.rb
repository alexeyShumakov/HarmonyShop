FactoryGirl.define do
	factory :product do
		title 'title'
		description 'desc'
		price 12
		leaf_category_id 1
		article 1234
		size_helper

		factory :product_with_add_desc do
			after(:create) do |product|
				create(:additional_description, product: product)
			end
		end
	end

end