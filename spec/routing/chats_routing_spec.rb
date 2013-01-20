require "spec_helper"

describe ChatsController do
  nasted_resources_should_routes 'rooms', 'chats', [:index, :show, :create]
end
