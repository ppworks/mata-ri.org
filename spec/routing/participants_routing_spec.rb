require "spec_helper"

describe ParticipantsController do
  nested_resource_should_routes 'rooms', 'participants', [:create, :destroy]
  resources_should_routes 'participants', [:index]
end
