require 'spec_helper'

describe Review do
  it "has a valid factory" do
    create(:restaurant, id: 1)
    expect(create(:review, restaurant_id: 1)).to be_valid
  end
  
  it "is invalid without a reviewer" do
    expect(build(:review, reviewer: nil)).to_not be_valid
  end
  
  it "is invalid without a body" do
    expect(build(:review, body: nil)).to_not be_valid  
  end
  
  it "is invalid without a rating" do
    expect(build(:review, rating: nil)).to_not be_valid
  end
  
  it "is invalid without a restaurant id" do
    expect(build(:review, restaurant_id: nil)).to_not be_valid
  end
end
