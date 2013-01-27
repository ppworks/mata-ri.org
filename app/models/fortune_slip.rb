class FortuneSlip < ActiveRecord::Base
  attr_accessible :content

  class << self
    def pick
      Rails.cache.fetch('fortune_slip:pick', expires_in: 1.day) do
        self.all
      end.sample(1).try('[]', 0)
    end
  end
end
