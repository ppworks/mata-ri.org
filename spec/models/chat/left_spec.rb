require 'spec_helper'

describe Chat::Left do
  ancestors_should_include [ActiveRecord::Base, Chat]

  let(:room) { FactoryGirl.create(:room1) }
  let!(:chat) { FactoryGirl.build(:chat_left, room_id: room.id) }

  describe "room last_left_at change from nil to 'last arrvied time'" do
    it do
      expect {
        chat.save
        room.reload
      }.to change { room.last_left_at }
    end
  end
end
