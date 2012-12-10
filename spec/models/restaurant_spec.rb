require 'spec_helper'

describe Restaurant do
  it "has a valid factory" do
    expect(create(:restaurant)).to be_valid
  end
  
  describe "name" do
    it "is invalid without a name" do
      expect(build(:restaurant, name: nil)).to_not be_valid
    end
    
    it "is no longer than 30 characters" do
      expect(build(:restaurant, name: "#{'a' * 31}")).to_not be_valid
    end
    
    it "is at least 2 characters" do
      expect(build(:restaurant, name: "A")).to_not be_valid
    end  
  end
  
  it "is invalid without a neighborhood" do
    expect(build(:restaurant, neighborhood: nil)).to_not be_valid
  end
  
  it "is invalid without a city" do
    expect(build(:restaurant, city: nil)).to_not be_valid 
  end
  
  it "is invalid without a state" do
    expect(build(:restaurant, state: nil)).to_not be_valid
  end
  
  it "is invalid without a zipcode" do
    expect(build(:restaurant, zipcode: nil)).to_not be_valid
  end
end
