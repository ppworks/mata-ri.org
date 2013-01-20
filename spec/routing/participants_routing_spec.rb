require "spec_helper"

describe ParticipantsController do
  nasted_resource_should_routes 'rooms', 'participants', [:create, :destroy]
  resources_should_routes 'participants', [:index]
end
