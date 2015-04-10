class OrderPolicy < ApplicationPolicy
	def show?
		@current_user.admin? || (@current_user == @record.user)
	end
end
