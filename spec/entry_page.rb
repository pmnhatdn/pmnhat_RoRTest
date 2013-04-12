require 'spec_helper'

describe "Entry pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "entry creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a entry" do
        expect { click_button "Post" }.not_to change(Entry, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end


  end
end