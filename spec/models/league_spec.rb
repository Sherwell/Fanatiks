require 'rails_helper'

RSpec.describe League, type: :model do
	let(:league){ build :league }
	

	context "with valid attributes" do 
		it "should be valid" do 
			expect(league).to be_valid
		end

		it "should belong to a sport" do 
			expect(league.sport).to be_truthy
		end
	end

	context "with invalid attributes" do
		it "is invalid without name" do 
			league.name = nil
			expect(league).to be_invalid
		end

		it "is invalid without logo" do
			league.logo = nil
			expect(league).to be_invalid
		end

		it "is invalid without sport" do
			league.sport = nil
			expect(league).to be_invalid
		end

		it "is invalid if end_date is before start_date" do 
			league.end_date = league.start_date - 10.days
			league.save

			expect(league.errors.messages[:end_date]).to include("must be before start_date")
		end
	end

	context "#toggle_active!" do 
		it "sets active to true if currently false" do 
			league.toggle_active!

			expect(league.active).to be_falsey
		end
	end
end
