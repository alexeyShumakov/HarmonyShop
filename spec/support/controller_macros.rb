module ControllerMacros
	def login_user
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			user =  FactoryGirl.create(:user)
			user.confirm!
			sign_in user
		end
	end

	def login_admin
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:admin]
			@admin =  FactoryGirl.create(:admin)
			@admin.confirm!
			sign_in :user, @admin
		end
	end
end