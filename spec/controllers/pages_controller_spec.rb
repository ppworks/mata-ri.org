require 'spec_helper'

describe PagesController do
  subject { response }
 
  describe "GET 'index'" do
    before do
      get 'index'
    end
    it { should be_success }
  end
end
