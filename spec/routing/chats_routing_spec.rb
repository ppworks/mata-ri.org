require "spec_helper"

describe ChatsController do
  nested_resources_should_routes 'rooms', 'chats', [:index, :show, :create]
end
