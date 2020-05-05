require_relative '../src/parser'

describe Parser do
    context "when file does not exist" do
        it "raises error" do
            expect{Parser.new('non_existin.json')}.to raise_error ArgumentError
        end
    end
end