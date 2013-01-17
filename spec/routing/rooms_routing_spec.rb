require "spec_helper"

describe RoomsController do
  describe "routing /rooms" do
    resources_should_routes 'rooms', [:index, :show]
  end
end
