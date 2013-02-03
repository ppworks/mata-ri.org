# coding: utf-8
require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  let!(:provider_facebook) { FactoryGirl.create(:provider_facebook) }
  ancestors_should_include [ActiveRecord::Base]

  it { user.should be_persisted }

  describe 'relation' do
    describe 'connects' do
      subject { user.connections }
      before do
        subject.build(provider_id: provider_facebook.id)
      end
      it { should have(1).items }
    end
    describe 'providers' do
      subject { user.providers }
      before do
        subject << Provider.named(:facebook).first
      end
      it { should have(1).items }
    end
  end 

  describe 'content_head' do
    subject { user.content_head }
    it { should == 'head for content' }
  end

  describe 'content_body' do
    subject { user.content_body }
    it { should == "body line1 for content\nbody line2 for content" }
  end

  describe 'set basic name' do
    let(:base_name) { 'てすと' }
    let(:user_name) { user.name }
    subject { user }
    before do
      user.name = user_name
      user.save
    end
    context 'given ""' do
      let(:user_name) { "#{base_name}" }
      it { user.base_name.should == base_name }
    end
    context 'given "@status"' do
      let(:user_name) { "#{base_name}@昼休み" }
      it { user.base_name.should == base_name }
    end
    context 'given "@"' do
      let(:user_name) { "#{base_name}@" }
      it { user.base_name.should == base_name }
    end
    context 'given "＠status"' do
      let(:user_name) { "#{base_name}＠ちょっとだけ" }
      it { user.base_name.should == base_name }
    end
    context 'given "＠"' do
      let(:user_name) { "#{base_name}＠" }
      it { user.base_name.should == base_name }
    end
  end
end
