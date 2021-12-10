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
			number_bw_21_and_99(number)
		elsif number <= 999
			number_bw_100_and_999(number)
		elsif number <= 9999
			number_bw_1000_and_9999(number)
		elsif number <= 99999
			number_bw_10000_and_99999(number)
		elsif number <= 999999
			number_bw_100000_and_999999(number)
		elsif number <= 99999999
			number_bw_1000000_and_9999999(number)
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

	def number_bw_100_and_999(number)
		div = number/100
		rem = number%100
		if rem == 0
			hundred_divisible_string_concat(div)
		else
			hundred_multiplier_string_concat(div, rem)
		end
	end
	
	def number_bw_1000_and_9999(number)
		div = number/1000
		rem = number%1000
		if rem == 0
			thousand_divisible_string_concat(div)
		elsif ((number/100) * 10)%100 == 0
			convert_numeric_to_english(number/1000) + " thousand" + " and " + convert_numeric_to_english(number%100)
		elsif number%100 == 0
			hundred_divisible_string_concat(number/100)
		else
			convert_numeric_to_english(number/100) + " hundred" + " and " + convert_numeric_to_english(number%100)
		end
	end
	
	def number_bw_10000_and_99999(number)
		div = number/1000
		rem = number%1000
		if rem == 0
			thousand_divisible_string_concat(div)
		elsif (number%1000)%100 == 0
			thousand_divisible_string_concat(div) + " " + convert_numeric_to_english(number%1000)
		else
			thousand_divisible_string_concat(div) +  " " + convert_numeric_to_english(number%1000)
		end
	end

	def number_bw_100000_and_999999(number)
		div = number/1000
		rem = number%100000
		if rem == 0
			hundred_thousand_divisible_string_concat(div)
		elsif number%100
			if (number%1000)%100 == 0
				hundred_thousand_divisible_string_concat(div) + " " + convert_numeric_to_english(number%1000)
			else
				convert_numeric_to_english(number/1000) + " thousand " + convert_numeric_to_english(number%1000)
			end
		else
			# hundred_thousand_divisible_string_concat(div) + " "+convert_numeric_to_english(number%100000)
			convert_numeric_to_english(number/100000) + " hundred and " + convert_numeric_to_english(number%100000)
		end
	end

	def number_bw_1000000_and_9999999(number)
		div = number/1000000
		rem = number%1000000
		if rem == 0
			million_divisible_string_concat(div)
		else
			million_divisible_string_concat(div) + " " + convert_numeric_to_english(number%1000000)
		end
	end

	def tenth_multiplier_string_concat(number, rem)
		number_to_english_map[number*10] + "-" + number_to_english_map[rem]
	end

	def hundred_divisible_string_concat(number)
		number_to_english_map[number] + " " + number_to_english_map[100]
	end

	def hundred_multiplier_string_concat(number, rem)
		hundred_divisible_string_concat(number) +
		" and " + self.convert_numeric_to_english(rem)
	end

	def thousand_divisible_string_concat(number)
		convert_numeric_to_english(number) + " " + number_to_english_map[1000]
	end

	def hundred_thousand_divisible_string_concat(number)
		convert_numeric_to_english(number) + " " + number_to_english_map[1000]
	end

	def million_divisible_string_concat(number)
		number_to_english_map[number] + " " + number_to_english_map[1000000]
	end
end
