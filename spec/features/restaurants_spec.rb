require 'spec_helper'

describe "Restaurants" do
  let! (:sushi_one) { create(:restaurant) }
  let! (:sushi_two) { create(:restaurant) }
  
  context "visiting the root path" do
    it "displays all restaurants" do
      visit root_path
      
      page.should have_content(sushi_one.name)
      page.should have_content(sushi_two.name)
    end
    
    it "displays each restaurant's information" do      
      visit root_path
      
      page.should have_content(sushi_one.name)
      page.should have_content(sushi_one.neighborhood)
      page.should have_content(sushi_one.address)
      page.should have_content(sushi_one.city)
      page.should have_content(sushi_one.state)
      page.should have_content(sushi_one.zipcode)
      
      page.should have_content(sushi_two.name)
      page.should have_content(sushi_two.neighborhood)
      page.should have_content(sushi_two.address)
      page.should have_content(sushi_two.city)
      page.should have_content(sushi_two.state)
      page.should have_content(sushi_two.zipcode)
    end
  end
  
  context "viewing a restaurant" do
    it "allows a user to view a specific restaurant's info" do
      visit root_path
      
      click_link sushi_one.name
            
      current_path.should eq restaurant_path(sushi_one)
      
      page.should have_content sushi_one.name
    end
  end
  
  context "adding a restaurant" do
    it "allows a user to add a new restaurant" do
      visit root_path
      
      click_link "Add restaurant"
      
      expect {
        fill_in "Name", with: "Sushi Town"
        fill_in "Neighborhood", with: "Marina"
        fill_in "Address", with: "123 Chesnut St."
        fill_in "City", with: "San Francisco"
        fill_in "State", with: "CA"
        fill_in "Zipcode", with: "94949"
        click_button "Add restaurant"
      }.to change(Restaurant, :count).by(1)
      
      current_path.should eq restaurant_path(Restaurant.last)
      
      page.should have_content Restaurant.last.name
    end
  end
end