require "spec_helper"

describe UsersController do
  describe "routing /users" do
    resources_should_routes 'users', [:index, :show]
    resource_should_routes 'users', [:edit, :update]
  end
end
