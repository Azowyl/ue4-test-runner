require_relative 'base_test'
require 'rainbow/refinement'
using Rainbow

class FailedTest < BaseTest
  BASE_MESSAGE = "Fail".bg(:red)

  def success?
    false
  end

  def pretty
    message = super
    entries.each {|entry| message << entry.pretty}
    message
  end
end
