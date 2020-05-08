require_relative 'base_test'

class FailedTest < BaseTest
  def success?
    false
  end
end
