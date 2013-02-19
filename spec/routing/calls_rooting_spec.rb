require "spec_helper"

describe CallsController do
  nested_resources_should_routes 'rooms', 'calls', [:create]
end
