require 'spec_helper'

describe ApplicationPolicy do

	let(:current_user) { build(:user, :confirmed_at => Date.today) }
	let(:current_admin) { build(:admin, :confirmed_at => Date.today) }

	subject { ApplicationPolicy }

	permissions :index? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :show? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :create? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :new? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :edit? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :update? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

	permissions :destroy? do
		it "denies access if user != admin" do
			expect(subject).not_to permit(current_user)
		end

		it "grant access if user == admin" do
			expect(subject).to permit(current_admin)
		end
	end

end