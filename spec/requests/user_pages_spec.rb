require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "GET /user_pages" do
    before { visit signup_path }
    
    it { should have_content('Sign up') }
    it { should have_title('Sign up') }
    

  end
  describe "get profile page" do

#    let(:user) { FactoryGirl.create(:user }

    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end
