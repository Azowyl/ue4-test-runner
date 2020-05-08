class BaseTest
  attr_reader :name
  attr_reader :entries

  def initialize(name, entries)
    @name = name
    @entries = entries
  end
end
