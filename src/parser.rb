require 'json'

class Parser
    FAILED_STATE = "Failed"
    SUCCESS_STATE = "Success"

    def self.parse(file_name)
        tests_results = JSON.parse(File.read(file_name))["tests"]
        tests = []
        tests_results.each do |test|
            test_name = test["testDisplayName"]
            test_type = test["state"] == SUCCESS_STATE ? SuccessfulTest.new(test_name) : FailedTest.new(test_name)
            tests << test_type
        end

        tests
    end
end
