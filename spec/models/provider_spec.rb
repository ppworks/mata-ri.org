require 'spec_helper'

describe Provider do
  let!(:provider_facebook) { FactoryGirl.create(:provider_facebook) }
  ancestors_should_include [ActiveRecord::Base]
  describe 'scope' do
    describe 'named' do
      subject { Provider.named(:facebook).first }
      it { subject.name == 'facebook' }
    end
  end
end
