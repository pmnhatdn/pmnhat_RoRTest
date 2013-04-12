require 'spec_helper'

describe "Authentication" do
  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "in the Entries controller" do

        describe "submitting to the create action" do
          before { post entries_path }
          specify { response.should redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete micropost_path(FactoryGirl.create(:entries)) }
          specify { response.should redirect_to(signin_path) }
        end
      end
    end
  end
end