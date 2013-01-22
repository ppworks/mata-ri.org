require 'spec_helper'

describe MovesController do
  let(:room1) { FactoryGirl.create(:room1) } 
  let(:room2) { FactoryGirl.create(:room2) } 
  let(:user) { FactoryGirl.create(:user) }
  
  subject { response }
  describe "post 'create'" do
    let(:target_room_id) { 'test' }
    before do
      sign_in user
      post :create, room_id: room1.id, target_room_id: room2.id 
    end
    it { should redirect_to room_chats_path(room2) }
  end
end
