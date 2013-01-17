require "spec_helper"

describe ArrivesController do
  nasted_resource_should_routes 'rooms', 'arrives', [:create, :destroy]
end
