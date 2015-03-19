require 'spec_helper'

describe Category do


	it "is invalid without a page title" do
		expect(build(:category, page_title: nil )).to have(1).error_on(:page_title)
	end

	it "is invalid without a name " do
		expect(build(:category, name: nil)).to have(1).error_on(:name)
	end

	it 'is invalid if parent is not integer' do
		expect(build(:category, parent_id: "12.3")).to have(1).error_on(:parent_id)
	end

	it 'is invalid if parent is string' do
		expect(build(:category, parent_id: "string")).to have(1).error_on(:parent_id)
	end

	it 'is valid with a name, page_title and parent_id=integer' do

		expect(build(:category, parent_id: 1)).to be_valid
	end

	it 'is valid with a name and page_title' do
		expect(build(:category)).to be_valid
	end

	describe 'node relationship' do
		before :each do
			@category = create(:category)
			@root_category = create(:category)
		end

		it 'is return self and sibling if node not leaf and not root' do
			@sibling_category = create(:category)
			@leaf_category = create(:category)

			@category.move_to_child_of(@root_category)

			@sibling_category.move_to_child_of(@root_category)

			@leaf_category.move_to_child_of(@category)

			expect(@category.get_category).to eq([@category, @sibling_category])
		end

		it 'is return parent and parent\'s siblings if node is leaf' do
			@category.move_to_child_of(@root_category)

			expect(@category.get_category).to eq(@root_category.self_and_siblings)
		end

		it 'is return self and siblings if node is root' do
			expect(@category.get_category).to eq(@category.self_and_siblings)
		end

	end

end
