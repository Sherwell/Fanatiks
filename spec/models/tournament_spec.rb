require 'rails_helper'

RSpec.describe Tournament, type: :model do
	let(:tournament) { build :tournament }

	context "with valid attributes" do 
		it "is valid" do 
			expect(tournament).to be_valid
		end

		it "should belong to a league" do 
			expect(tournament.league).to be_truthy
		end
	end

	context "with invalid attributes" do 
		it "should be invalid without name" do 
			tournament.name = nil
			expect(tournament).to be_invalid
		end

		it "should be invalid without year" do 
			tournament.year = nil
			expect(tournament).to be_invalid
		end

		it "should be invalid without league" do 
			tournament.league = nil
			expect(tournament).to be_invalid
		end
	end
end
