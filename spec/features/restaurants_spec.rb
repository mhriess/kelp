require 'spec_helper'

describe "Restaurants" do
  context "visiting the root path" do
    it "displays all restaurants" do
      sushi_one = create(:restaurant)  
      sushi_two = create(:restaurant)
      
      visit root_path
      
      page.should have_content(sushi_one.name)
      page.should have_content(sushi_two.name)
    end
    
    it "displays each restaurant's information" do
      sushi_one = create(:restaurant)  
      sushi_two = create(:restaurant)
      
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
end