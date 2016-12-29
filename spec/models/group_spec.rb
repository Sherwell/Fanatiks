require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group){ create :group }

  context "with valid attributes" do 
  	it "is valid" do 
  		expect(group).to be_valid
  	end

  	it "belongs to a tournament" do 
  		expect(group.tournament).to be_truthy
  	end
  end

  context "with invalid attributes" do 
  	it "is invalid without name" do 
  		group.name = nil
  		expect(group).to be_invalid
  	end

  	it "is invalid without position" do 
  		group.position = nil
  		expect(group).to be_invalid
  	end

  	it "is invalid without position" do 
  		group.tournament = nil
  		expect(group).to be_invalid
  	end
  end
end
