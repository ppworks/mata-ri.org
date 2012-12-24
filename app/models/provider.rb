class Provider < ActiveRecord::Base
  include Common::Named
  attr_accessible :name
end
