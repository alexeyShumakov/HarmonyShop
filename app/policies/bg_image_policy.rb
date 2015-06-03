class BgImagePolicy < ApplicationPolicy
	def set_current?
		@current_user.admin?
	end
end