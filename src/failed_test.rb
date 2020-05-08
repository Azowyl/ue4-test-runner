require_relative 'base_test'
require 'rainbow/refinement'
using Rainbow

class FailedTest < BaseTest
  BASE_MESSAGE = "Fail".bg(:red)

  def success?
    false
  end

  def pretty
    message = "#{BASE_MESSAGE} -> #{name} \n"
    entries.each {|entry| message << entry.pretty}
    message
  end
end
