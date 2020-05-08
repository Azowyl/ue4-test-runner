require_relative '../src/parser'
require_relative '../src/successful_test'
require_relative '../src/../src/failed_test'

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

        it "creates SuccessfulTest " do
          expect(tests.first.success?).to eq true
        end
      end

      context "when there is a failed test" do
        let(:tests) {Parser.parse(File.absolute_path('spec/fixtures/failed.json'))}

        it "creates FailedTest " do
          expect(tests.first.success?).to eq false
        end
      end
    end
end
