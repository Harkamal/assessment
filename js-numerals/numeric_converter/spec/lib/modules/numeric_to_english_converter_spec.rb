# require 'rspec_rails'
require_relative '../../../lib/modules/numeric_to_english_converter'
class NumericTestClass
  include NumericToEnglishConverter
end

RSpec.describe NumericToEnglishConverter do
  let(:converter) { NumericTestClass.new }
  describe '#convert_numeric_to_english' do
    it 'converts 1 number to english' do
        expect(converter.convert_numeric_to_english(1)).to eq('one')
    end

    it 'converts 19 number to english' do
        expect(converter.convert_numeric_to_english(19)).to eq('nineteen')
    end

    it 'converts 28 to english with "-" sepration' do
        expect(converter.convert_numeric_to_english(28)).to eq('twenty-eight')
    end

    it 'converts 90 number multiplier of 10 to english' do
        expect(converter.convert_numeric_to_english(90)).to eq('ninety')
    end

    it 'converts 100 number to english' do
        expect(converter.convert_numeric_to_english(100)).to eq('one hundred')
    end

    it 'converts 101 number to english' do
        expect(converter.convert_numeric_to_english(101)).to eq('one hundred and one')
    end

    it 'converts 999 number to english' do
      expect(converter.convert_numeric_to_english(999)).to eq('nine hundred and ninety-nine')
    end

    it 'converts 1000 number to english' do
      expect(converter.convert_numeric_to_english(1000)).to eq('one thousand')
    end

    it 'converts 1010 to english' do
      expect(converter.convert_numeric_to_english(1010)).to eq('one thousand and ten')
    end

    it 'converts 1111 to english' do
      expect(converter.convert_numeric_to_english(1111)).to eq('eleven hundred and eleven')
    end

    it 'converts 1999 to english' do
      expect(converter.convert_numeric_to_english(1999)).to eq('nineteen hundred and ninety-nine')
    end

    it 'converts 2001 to english' do
      expect(converter.convert_numeric_to_english(2001)).to eq('two thousand and one')
    end

    it 'converts 9999 to english' do
      expect(converter.convert_numeric_to_english(9999)).to eq('ninety-nine hundred and ninety-nine')
    end

    it 'converts 17999 to english' do
      expect(converter.convert_numeric_to_english(17999)).to eq('Sorry, application could not translate 17999 into english')
    end

  end
end
