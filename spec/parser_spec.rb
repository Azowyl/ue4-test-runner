require_relative '../src/parser'
require_relative '../src/successful_test'

describe Parser do
    context 'when file does not exist' do
        it 'raises error' do
            expect{Parser.parse('non_existin.json')}.to raise_error Errno::ENOENT
        end
    end

    context 'when file exists' do
        it "doesn't raise error" do
            expect{Parser.parse(File.absolute_path('spec/fixtures/test.json'))}.not_to raise_error Errno::ENOENT
        end
    end

    describe "#parse" do
      let(:tests) {Parser.parse(File.absolute_path('spec/fixtures/test.json'))}
      context "when there is a successful test" do
        it "creates SuccessfulTest " do
          expect(tests.first.success?).to eq true
        end
      end
    end
end
