require 'rails_helper'

RSpec.describe GroupTeam, type: :model do
  let( :group_team ) { create :group_team }

  context "with valid attributes" do 
  	it "is valid" do 
  		expect(group_team).to be_valid
  	end

  	it "belongs to a group" do 
  		expect(group_team.group).to be_truthy
  	end

  	it "belongs to a team" do 
  		expect(group_team.team).to be_truthy
  	end
  end

  describe "#all_base_attributes_present" do 
  	context "with all attributes present" do 
  		it "returns true" do 
  			expect(group_team).to be_valid
  			expect(group_team.send("all_base_attributes_present?")).to eq(true)
  		end
  	end

  	context "with any base attribute missing" do
  		it "returns false and adds error to base" do
	  		group_team.pg = nil
	  		group_team.valid? 

	  		expect(group_team).to be_invalid
	  		expect(group_team.send("all_base_attributes_present?")).to eq(false)
	  		expect(group_team.errors[:base]).to include("All attributes are needed")
	  	end
  	end
  end
end
