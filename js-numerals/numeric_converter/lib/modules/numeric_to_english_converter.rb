# This module helps to convert a numeric number to english phrase of that number.
module NumericToEnglishConverter
	def number_to_english_map
		{
			0=>"zero", 1=>"one", 2=>"two", 3=>"three",
			4=>"four", 5=>"five",6=>"six", 7=>"seven", 8=>"eight",
			9=>"nine",10=>"ten",11=>"eleven",12=>"twelve",
			13=>"thirteen",14=>"fourteen",15=>"fifteen",
			16=>"sixteen",17=>"seventeen",18=>"eighteen",
			19=>"nineteen",20=>"twenty",30=>"thirty",
			40=>"forty",50=>"fifty",60=>"sixty",70=>"seventy",
			80=>"eighty",90=>"ninety", 100=>"hundred", 1000=> "thousand", 1000000 => "million"
		}
	end

	def convert_numeric_to_english(number)
		if number == 100 || number == 1000 || number == 1000000
			"one " + number_to_english_map[number]
		elsif number_to_english_map.has_key?(number)
			number_to_english_map[number]
		elsif number <= 99
			self.number_bw_21_and_99(number)
		else
			"Sorry, application could not translate #{number} into english"
		end
	end

	def number_bw_21_and_99(number)
		div = number/10
		rem = number%10

		if rem == 0
			number_to_english_map[number]
		else
			tenth_multiplier_string_concat(div, rem)
		end
	end

	
	def tenth_multiplier_string_concat(number, rem)
		number_to_english_map[number*10] + "-" + number_to_english_map[rem]
	end
end
