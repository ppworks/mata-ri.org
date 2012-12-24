# coding: utf-8
require "spec_helper"

describe 'sign_in' do
  let!(:provider_facebook) { FactoryGirl.create(:provider_facebook) }
  let(:new_user) { FactoryGirl.build(:user) }
  before do
    I18n.locale = :ja
  end
  context 'sign in with facebook account' do
    before do
      sign_in new_user, :facebook
      visit "/users/auth/facebook"
    end
    it { page.status_code.should == 200 }
  end
end
