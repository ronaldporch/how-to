require "test_helper"

class HowtoTest < ActiveSupport::TestCase

  def howto
    @howto ||= Howto.new
  end

  def test_valid
    assert howto.valid?
  end

end
