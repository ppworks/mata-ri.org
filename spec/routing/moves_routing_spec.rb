require "spec_helper"

describe MovesController do
  nasted_resource_should_routes 'rooms', 'moves', [:create]
end
