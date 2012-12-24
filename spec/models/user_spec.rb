require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  ancestors_should_include [ActiveRecord::Base]
  it { user.should be_persisted }
end
