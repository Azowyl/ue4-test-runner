class TestEntry
  def initialize(data)
    @data = data
    @event = data["event"]
  end

  def pretty
    "#{@event["type"]}: #{@event["message"]} at #{@data["filename"]} #{@data["lineNumber"]}"
  end
end
