require 'spec_helper'

describe RoomsController do
  subject { response }
  let(:room) { FactoryGirl.create(:room1) } 
  
  describe "GET 'index'" do
    before do
      get :index
    end
    it { should be_success }
  end

  describe "GET 'show'" do
    before do
      get :show, id: room.id
    end
    it { should be_success }
  end
end
