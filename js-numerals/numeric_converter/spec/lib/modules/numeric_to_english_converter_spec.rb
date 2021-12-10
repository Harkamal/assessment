# require 'rspec_rails'
require_relative '../../../lib/modules/numeric_to_english_converter'
class NumericTestClass
  include NumericToEnglishConverter
end

RSpec.describe NumericToEnglishConverter do
  let(:converter) { NumericTestClass.new }
  describe '#convert_numeric_to_english' do
    it 'converts one digit number to english' do
        expect(converter.convert_numeric_to_english(1)).to eq('one')
    end

    it 'converts two digits number to english' do
        expect(converter.convert_numeric_to_english(19)).to eq('nineteen')
    end

    it 'converts two digits number to english with "-" sepration' do
        expect(converter.convert_numeric_to_english(28)).to eq('twenty-eight')
    end

    it 'converts two digits multiplier of 10 number to english' do
        expect(converter.convert_numeric_to_english(90)).to eq('ninety')
    end

    it 'converts 100 number to english' do
        expect(converter.convert_numeric_to_english(100)).to eq('one hundred')
    end

    it 'converts three digits number to english' do
        expect(converter.convert_numeric_to_english(101)).to eq('Sorry, application could not translate 101 into english')
    end
  end
end
