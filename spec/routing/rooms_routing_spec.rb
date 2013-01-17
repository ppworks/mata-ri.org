require "spec_helper"

describe RoomsController do
  describe "routing /" do
    it { get('/').should route_to('rooms#index') }
    it { File.exists?("#{Rails.root}/public/index.html").should be_false }
  end
  describe "routing /rooms" do
    resources_should_routes 'rooms', [:show]
  end
end
