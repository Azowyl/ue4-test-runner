require 'json'

class Parser
    def self.parse(file_name)
        JSON.parse(File.read(file_name))
        return [SuccessfulTest.new]
    end
end
