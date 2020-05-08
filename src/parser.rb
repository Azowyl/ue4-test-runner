require 'json'

class Parser
    FAILED_STATE = "Failed"
    SUCCESS_STATE = "Success"

    def self.parse(file_name)
        tests_results = JSON.parse(File.read(file_name))["tests"]
        return tests_results.map do |test|
            test_name = test["testDisplayName"]
            entries = test["entries"].map{|entry| TestEntry.new(entry)}
            test["state"] == SUCCESS_STATE ? SuccessfulTest.new(test_name, entries) : FailedTest.new(test_name, entries)
        end
    end
end
