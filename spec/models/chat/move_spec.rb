require 'spec_helper'

describe Chat::Move do
  ancestors_should_include [ActiveRecord::Base, Chat]

  let!(:room1) { FactoryGirl.create(:room1) }
  let!(:room2) { FactoryGirl.create(:room2) }
  let!(:chat) { FactoryGirl.build(:chat_move, room_id: room1.id, target_room_id: room2.id) }

  describe '#target_room_id' do
    subject { chat }
    it { subject.target_room_id.should be_instance_of Fixnum }
    it { subject.target_room.id.should == room2.id }
  end
end
