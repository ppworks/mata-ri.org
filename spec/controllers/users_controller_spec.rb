require 'spec_helper'

describe UsersController do
  subject { response }
  let(:user) { FactoryGirl.create(:user_reserved) }
  
  describe "GET 'index'" do
    before do
      get :index
    end
    it { should be_success }
  end

  describe "get 'show'" do
    before do
      get :show, id: user.id
    end
    it { should be_success }
  end

  describe "get 'edit'" do
    before do
      sign_in user
      get :edit
    end
    it { should be_success }
  end

  describe "put 'update'" do
    before do
      sign_in user
      put :update
    end
    it { should redirect_to users_path }
  end
end
