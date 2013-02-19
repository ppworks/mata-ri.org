require "spec_helper"

describe FortuneSlipsController do
  nested_resources_should_routes 'rooms', 'fortune_slips', [:create]
end
