require 'json'

class Parser
    FAILED_STATE = "Failed"
    SUCCESS_STATE = "Success"

    def self.parse(file_name)
        tests_results = JSON.parse(File.read(file_name))["tests"]
        tests = []
        tests_results.each do |test|
            test_type = test["state"] == SUCCESS_STATE ? SuccessfulTest.new : FailedTest.new
            tests << test_type
        end

        tests
    end
end
