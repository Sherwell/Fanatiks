require 'rails_helper'

RSpec.describe Team, type: :model do
  let( :team ){ create :team }

  context "with valid attributes" do 
  	it "should be valid" do 
  		expect(team).to be_valid
  	end
  end

  context "with invalid attributes" do 
  	it "should be invalid without name" do 
  		team.name = nil
  		expect(team).to be_invalid
  	end

  	it "should be invalid without logo" do 
  		team.logo = nil
  		expect(team).to be_invalid
  	end
  end
end
