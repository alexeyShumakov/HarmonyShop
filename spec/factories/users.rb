FactoryGirl.define do
  factory :user do
    name  'John Doe'
    email  'example@gmail.com'
    password  'topsecret'
    password_confirmation  'topsecret'
    role  0
  end

	factory :admin, class: User do
		name 'John Admin'
		email 'admin@gmail.com'
		password 'topsecret'
		password_confirmation 'topsecret'
		role 1
	end

end
