require "spec_helper"

describe FortuneSlipsController do
  nasted_resources_should_routes 'rooms', 'fortune_slips', [:create]
end
