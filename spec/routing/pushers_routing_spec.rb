require "spec_helper"

describe PushersController do
  describe "routing /pusher/authentication" do
    it { post('/pusher/authentication').should route_to('pushers#authentication') }
  end
end
