require "spec_helper"

describe PagesController do
  describe "routing /" do
    it { get("/").should route_to("pages#index") }
    it { File.exists?("#{Rails.root}/public/index.html").should be_false }
  end
end
