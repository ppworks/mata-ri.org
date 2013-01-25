require "spec_helper"

describe CallsController do
  nasted_resources_should_routes 'rooms', 'calls', [:create]
end
