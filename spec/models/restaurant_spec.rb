require 'spec_helper'

describe Restaurant do
  it "has a valid factory" do
    create(:restaurant).should be_valid
  end
  it "is invalid without a name"
  it "is invalid without a neighborhood"
  it "is invalid without a city"
  it "is invalid without a state"
  it "is invalid without a zipcode"
end
