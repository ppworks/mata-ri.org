module Common::Named
  def self.included(base)
    base.extend ClassMethods
    base.scope :named, lambda{|name|
      base.where(name: name)
    }
  end

  module ClassMethods
  end
end
