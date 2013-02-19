require "spec_helper"

describe MovesController do
  nested_resource_should_routes 'rooms', 'moves', [:create]
end
