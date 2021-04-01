require_relative 'base_test'
require 'rainbow/refinement'
using Rainbow

class SuccessfulTest < BaseTest
  BASE_MESSAGE = "Pass".bg(:green)

  def success?
    true
  end
end
