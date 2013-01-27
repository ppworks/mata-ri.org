require 'spec_helper'

describe Chat do
  ancestors_should_include [ActiveRecord::Base]
  describe 'colors' do
    subject { Chat.colors }
    it { should be_instance_of Array }
  end

  describe 'styles' do
    subject { Chat.styles }
    it { should be_instance_of Array }
    it { subject[0][0].should be_instance_of String }
    it { subject[0][1].should be_instance_of String }
  end

  describe 'style_keys' do
    subject { Chat.style_keys }
    it { should be_instance_of Array }
    it { subject[0].should be_instance_of String }
  end
end
