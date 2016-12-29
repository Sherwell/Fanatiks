require 'rails_helper'

RSpec.describe Sport, type: :model do
  let (:subject) {create :sport}

  describe "with valid attributes" do 
  	it "is valid" do 
  		expect(subject).to be_valid
  	end

  	it "can have many leagues" do 
  		league = build :league
  		subject.leagues << league
  		league.save
  		expect(subject.leagues).to include(league) 
  	end
  end

  describe "with missing attributes" do 
  	it "is invalid without a name" do 
  		subject.name = nil
  		expect(subject).to be_invalid
  	end

  	it "is invalid without an image" do 
  		subject.image = nil
  		expect(subject).to be_invalid
  	end
  end
end
