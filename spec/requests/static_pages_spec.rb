require 'spec_helper'

describe "Static Pages" do 
  describe "Home pges" do
    it "hould have the conternt 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
      expect(page).to have_title("| Home")
    end
  end
  
  describe "Home pges" do
    it "hould have the conternt 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
      expect(page).to have_title("| Help")
    end
  end
  
  describe "About page" do
    it "hould have the conternt 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
      expect(page).to have_title("| About Us")
    end
  end
  
  
end
