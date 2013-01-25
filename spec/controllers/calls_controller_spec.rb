require 'spec_helper'

describe CallsController do
  let(:room1) { FactoryGirl.create(:room1) } 
  let(:room2) { FactoryGirl.create(:room2) } 
  let(:user) { FactoryGirl.create(:user) }
  
  subject { response }
  describe "post 'create'" do
    let(:target_room_id) { 'test' }
    before do
      sign_in user
      post :create, room_id: room1.id, chat: {target_room_id: room2.id}, content: 'call'
    end
    it { should redirect_to room_chats_path(room1) }
  end
end
