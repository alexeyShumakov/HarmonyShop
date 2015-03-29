require 'rails_helper'

describe Category do


	it "is invalid without a page title" do
		category = build(:category, page_title: nil )
		category.valid?
		expect(category.errors[:page_title].size).to eq(1)

	end

	it "is invalid without a name " do
		category = build(:category, name: nil)
		category.valid?
		expect(category.errors[:name].size).to eq(1)
	end

	it 'is invalid if parent is not integer' do
		category = build(:category, parent_id: 12.3)
		category.valid?
		expect(category.errors[:parent_id].size).to eq(1)
	end

	it 'is invalid if parent is string' do
		category = build(:category, parent_id: "str")
		category.valid?
		expect(category.errors[:parent_id].size).to eq(1)
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
