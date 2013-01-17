require 'spec_helper'

describe ArrivesController do
  let(:room) { FactoryGirl.create(:room1) } 
  
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
      it { should be_success }
    end
  end

  describe "DELETE 'destroy'" do
    let(:color) { '#333333' }
    context 'no name given' do
      let(:user_name) { '' }
      before do
        delete :destroy, room_id: room.id, user_name: user_name, color: color
      end
      it { should redirect_to room_path(room) }
    end

    context 'valid name given' do
      let(:user_name) { 'test' }
      before do
        delete :destroy, room_id: room.id, user_name: user_name, color: color
      end
      it { should be_success }
    end
  end
end
