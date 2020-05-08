require_relative '../src/parser'
require_relative '../src/successful_test'
require_relative '../src/failed_test'
require_relative '../src/test_entry'
require_relative '../src/final_test'

describe Parser do
    context 'when file does not exist' do
        it 'raises error' do
            expect{Parser.parse('non_existin.json')}.to raise_error Errno::ENOENT
        end
    end

    context 'when file exists' do
        it "doesn't raise error" do
            expect{Parser.parse(File.absolute_path('spec/fixtures/successful.json'))}.not_to raise_error Errno::ENOENT
        end
    end

    describe "#parse" do
      context "when there is a successful test" do
        let(:tests) {Parser.parse(File.absolute_path('spec/fixtures/successful.json'))}

        it "creates a SuccessfulTest " do
          expect(tests.first.success?).to eq true
        end

        it "parses the test name" do
          expect(tests.first.name).to eq "successful test"
        end

        it "ignores info entries" do
          expect(tests.first.pretty).to_not include "Info"
        end
      end

      context "when there is a failed test" do
        let(:tests) {Parser.parse(File.absolute_path('spec/fixtures/failed.json'))}

        it "creates a FailedTest " do
          expect(tests.first.success?).to eq false
        end

        it "parses the test name" do
          expect(tests.first.name).to eq "failed test"
        end

        it "parses each error entry" do
          expect(tests.first.pretty).to include "failed test"
          expect(tests.first.pretty).to include "Test Failed"
          expect(tests.first.pretty).to include "some_filename"
          expect(tests.first.pretty).to include "3" # line number
        end
      end

      context "last test" do
        let(:last) {Parser.parse(File.absolute_path('spec/fixtures/failed.json')).last}

        it "is successful" do
          expect(last.success?).to eq true
        end

        it "includes total test" do
          expect(last.pretty).to include "1"
        end

        it "includes total successful test" do
          expect(last.pretty).to include "1"
        end

        it "includes total failed test" do
          expect(last.pretty).to include "0"
        end
      end
    end
end
