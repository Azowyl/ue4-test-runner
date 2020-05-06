require_relative '../src/parser'

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
end
