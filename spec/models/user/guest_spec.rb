require 'spec_helper'

describe User::Guest do
  ancestors_should_include [ActiveRecord::Base]

  describe 'after_initialize' do
    subject do
      User::Guest.new
    end
    it { subject.email.should be_present }
    it { subject.password.should be_present }
    it { subject.encrypted_password.should be_present }
  end
end
