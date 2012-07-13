require 'spec_helper'

describe "Authentication" do
  
  subject { page }

 describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe "followed by signout" do
              before { click_link "Sign out" }
              it { should have_link('Sign in') }
      end
       
    end

     describe "after visiting another page" do
          before { click_link "Home" }
          it { should_not have_selector('div.alert.alert-error') }
      end
 end


end
