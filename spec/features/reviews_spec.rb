require 'spec_helper'

describe "Reviews" do
  let! (:sushi_one) { create(:restaurant) }
  
  context "on the root page" do
    it "displays the first 50 characters of a review's body
     below the appropriate restaurant" do
      review = create(:review, restaurant_id: sushi_one.id)
      
      visit root_path
      
      within(:css, "div#review_#{review.id}") do
        page.should have_content review.body.slice(0,50)
      end
    end
  end
  
  context "adding a review" do
    it "allows a user to add a new review" do
      visit root_path
      
      click_link "Add Review"
      
      expect {
        fill_in "Reviewer", with: "Bob Loblaw"
        fill_in "Review", with: Faker::LoremIpsum.paragraph
        page.select(sushi_one.name, :from => "Restaurants")
        click_button "Submit review"
      }.to change(Review, :count).by(1)
    end
  end
end