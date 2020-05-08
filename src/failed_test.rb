require_relative 'base_test'

class FailedTest < BaseTest
  def success?
    false
  end

  def pretty
    message = "FAIL -> #{name} \n"
    entries.each {|entry| message << entry.pretty}
    message
  end
end
