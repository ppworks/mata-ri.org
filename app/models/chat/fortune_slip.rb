class Chat::FortuneSlip < Chat
  before_create :set_content

  private
  def set_content
    self.content = ::FortuneSlip.pick.try(:content)
  end
end
