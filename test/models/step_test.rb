require "test_helper"

class StepTest < ActiveSupport::TestCase

  def step
    @step ||= Step.new
  end

  def test_valid
    assert step.valid?
  end

end
