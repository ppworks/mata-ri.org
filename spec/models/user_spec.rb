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
end