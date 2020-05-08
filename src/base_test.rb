class BaseTest
  BASE_MESSAGE = ""

  attr_reader :name
  attr_reader :entries

  def initialize(name, entries)
    @name = name
    @entries = entries
  end

  def pretty
    "#{BASE_MESSAGE} -> #{name} \n"
  end
end
