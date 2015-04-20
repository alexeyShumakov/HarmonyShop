require 'faker'
FactoryGirl.define do
  factory :user do
    name  'John Doe'
    email  'example3@gmail.com'
    password  'topsecret'
    password_confirmation  'topsecret'
    confirmed_at Date.today
    role  0
  end

	factory :admin, class: User do
		name 'John Admin'
		email 'admin@gmail.com'
		password 'topsecret'
		password_confirmation 'topsecret'
		confirmed_at Date.today
		role 1
	end

end
