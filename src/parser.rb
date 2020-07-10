require 'json'

require_relative './test_entry'
require_relative './failed_test'
require_relative './successful_test'
require_relative './final_test'

class Parser
    FAILED_STATE = "Failed"
    SUCCESS_STATE = "Success"

    def self.parse(file_name)
        results = eval(File.read(file_name))
        tests_results = results[:tests]
        tests = tests_results.map do |test|
            test_name = test[:testDisplayName]
            entries = test[:entries].map{|entry| TestEntry.new(entry)}
            test[:state] == SUCCESS_STATE ? SuccessfulTest.new(test_name, entries) : FailedTest.new(test_name, entries)
        end
        tests << FinalTest.new(results)
        tests
    end
end
