require 'spec_helper'

describe FortuneSlipsController do
  let(:room) { FactoryGirl.create(:room1) }
  let(:user) { FactoryGirl.create(:user) }
  
  subject { response }
  describe "post 'create'" do
    before do
      sign_in user
      post :create, room_id: room.id
    end
    it { should redirect_to room_chats_path(room) }
  end
end
