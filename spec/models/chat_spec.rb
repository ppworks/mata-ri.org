require 'spec_helper'

describe Chat do
  ancestors_should_include [ActiveRecord::Base]
  describe 'colors' do
    subject { Chat.colors }
    it { should be_instance_of Array }
  end
end
