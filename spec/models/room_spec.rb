require 'spec_helper'

describe Room do
  ancestors_should_include [ActiveRecord::Base]
  before do
    Room.delete_all
  end

  4.times do |i|
    room_key = "room#{i + 1}".to_sym
    let!(room_key) { FactoryGirl.create(room_key) }
  end
  describe '#other_room_list' do
    subject { room1.other_room_list }
    it { should have(3).items }
  end
end
