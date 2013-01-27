require 'spec_helper'

describe FortuneSlip do
  (1..3).each do|i|
    key = "fortune_slip#{i}".to_sym
    let!(key) { FactoryGirl.create(key) }
  end

  describe 'pick' do
    subject { FortuneSlip.pick }
    it { should be_instance_of FortuneSlip }
  end
end
