require 'spec_helper'

describe ParticipantsController do
  let(:room) { FactoryGirl.create(:room1) } 
  let(:user) { FactoryGirl.create(:user) }
  
  subject { response }
  describe "POST 'create'" do
    let(:color) { '#333333' }
    context 'no name given' do
      let(:user_name) { '' }
      before do
        post :create, room_id: room.id, user_name: user_name, color: color
      end
      it { should redirect_to room_path(room) }
    end

    context 'valid name given' do
      let(:user_name) { 'test' }
      before do
        post :create, room_id: room.id, user_name: user_name, color: color
      end
      it { should redirect_to room_chats_path(room) }
    end
  end

  describe "DELETE 'destroy'" do
    let(:color) { '#333333' }
    let(:user_name) { 'test' }
    before do
      sign_in user
      delete :destroy, room_id: room.id, user_name: user_name, color: color
    end
    it { should redirect_to root_path }
  end
end
